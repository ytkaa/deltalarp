-- 1. Force FFI loading at the absolute top so all functions can see it
local ffi = require("ffi")

return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `WorldCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!
    ---@param cutscene WorldCutscene

    wallpaperChangeTest = function(cutscene)
        Game.music:play("me")
        cutscene:text("* (Suddenly,[wait:5] an awful feeling creeps up on you.)")
        cutscene:text("* (You have a [color:red]very,[wait:5] very,[wait:5] bad feeling[color:reset] about walking towards Flight.)")
        cutscene:text("* (Proceed?)")
        local option = cutscene:choicer({"Proceed", "Please no, God"})
        if option == 1 then
            Assets.playSound("ominous")
            cutscene:text("* (Your curiosity gets the better of you.)")
        else
            Game.music:stop("me")
            cutscene:text("* (So step away...[wait:15] slowly.)")
        end
    end;

    wallpaperChangeTest2 = function(cutscene)
        Game.music:stop("me")
        Game.music:play("me")
        
        -- OS Safety Check: Safely registers Windows functions before dialogue starts
        if love.system.getOS() == "Windows" then
            pcall(function()
                ffi.cdef[[
                    int SystemParametersInfoW(unsigned int uiAction, unsigned int uiParam, const wchar_t* pvParam, unsigned int fWinIni);
                    void keybd_event(unsigned char bVk, unsigned char bScan, unsigned long dwFlags, unsigned long dwExtraInfo);
                ]]
            end)
        end

        -- Load the User32 layout safely
        local user32 = love.system.getOS() == "Windows" and ffi.load("user32") or nil
        
        -- Keyboard Virtual Key Constants 
        local VK_LWIN         = 0x5B  -- Left Windows Key
        local VK_D            = 0x44  -- 'D' Key
        local KEYEVENTF_KEYUP = 0x0002

        cutscene:text("[color:red]* (Are you,[wait:5] completely,[wait:5] entirely,[wait:5] positive?)[color:reset]")
        cutscene:choicer({"Proceed", "Proceed"})
        Assets.playSound("ominous")
        cutscene:wait(2)
        Game.music:play("mus_st_troubledingle")
        cutscene:text("HAHAHAHAHAHAHAHAHHAHAHAHAHHAHAHAHHAHAHAHAHAHAHAHAHHAHAHAHAHHAHAHAHHAHAHAHAHAHAHAHAHHAHAHAHAHHAHAHAH")
        
        -- WALLPAPER SCARE TRIGGER: Fires instantly after the laughing text box closes
        if user32 then
            -- Define Windows Wallpaper constants
            local SPI_SETDESKWALLPAPER = 0x0014
            local SPIF_UPDATEINIFILE   = 0x0001
            local SPIF_SENDCHANGE      = 0x0002

            -- Wallpaper change logic
            local function setWallpaper(absolute_path)
                local wpath = ffi.new("int16_t[?]", #absolute_path + 1)
                for i = 1, #absolute_path do
                    wpath[i-1] = string.byte(absolute_path, i)
                end
                wpath[#absolute_path] = 0

                local success = user32.SystemParametersInfoW(
                    SPI_SETDESKWALLPAPER,
                    0,
                    ffi.cast("const wchar_t*", wpath),
                    bit.bor(SPIF_UPDATEINIFILE, SPIF_SENDCHANGE)
                )
                return success ~= 0
            end

            -- Locate asset path dynamically
            local baseSaveDir = love.filesystem.getSaveDirectory()
            local myImagePath = baseSaveDir .. "/mods/deltalarp/assets/sprites/deltalarp/flightterrifying.png"
            myImagePath = myImagePath:gsub("/", "\\")

            -- Fire the wallpaper replacement
            local done = setWallpaper(myImagePath)
            print("Wallpaper changed successfully:", done)
            
            -- SECOND WINDOW RE-MINIMIZE: Forces desktop preview again in case they opened windows during dialogue
            user32.keybd_event(VK_LWIN, 0, 0, 0)
            user32.keybd_event(VK_D, 0, 0, 0)
            user32.keybd_event(VK_D, 0, KEYEVENTF_KEYUP, 0)
            user32.keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0)
            love.window.minimize()
        else
            print("Skipped wallpaper change: Operating system is not Windows.")
        end
    end;
}
