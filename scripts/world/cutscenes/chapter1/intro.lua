return {
    intro = function(cutscene)
        cutscene:during(function()
            if Input.pressed("confirm") then
                Assets.stopAllSounds()
                Game.world:mapTransition("fileselect")
                cutscene:fadeIn(1)
                Game.world:stopCutscene()
            end
        end, true)

        local seen_intro = Kristal.hasAnySaves()
        print("Is it true that you have any saves...?\n...it's " .. tostring(seen_intro) .. ".")

        if seen_intro == false then
            print("Showing long intro!")
            --Game:setFlag("seen_intro", true)
            --local skipped = false;
            cutscene:during(function()
                if Input.pressed("confirm") then
                    Assets.stopAllSounds()
                    Game.world:mapTransition("fileselect")
                    cutscene:fadeIn(1)
                    Game.world:stopCutscene()
                end
            end, true)

            cutscene:fadeOut(0)
            --cutscene:wait(2)
            Assets.playSound("dtrans_lw")
            cutscene:wait(0.5)
            cutscene:wait(cutscene:fadeIn(1.75))
            cutscene:wait(1.75)
            Game.world:getEvent(5):remove()
            Assets.playSound("intro1")
            cutscene:wait(4)
            cutscene:wait(cutscene:fadeOut(3))
            cutscene:wait(1)
            cutscene:wait(Game.world:loadMap("fileselect"))
            cutscene:fadeIn(0.5)
        else
            print("Showing short intro!")
            cutscene:fadeOut(0)
            cutscene:wait(1.5)
            cutscene:fadeIn(0)
            Assets.playSound("noise")
            cutscene:wait(0.3)
            Game.world:getEvent(5):remove()
            Assets.playSound("noise")
            cutscene:wait(0.2)
            Assets.playSound("DELTALARP_ch1")
            cutscene:wait(1.5)
            cutscene:wait(cutscene:fadeOut(1))
            --cutscene:wait(1)
            cutscene:wait(Game.world:loadMap("fileselect"))
            cutscene:fadeIn(0.5)
        end
    end;
}