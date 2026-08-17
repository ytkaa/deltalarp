local World, super = HookSystem.hookScript(World)

function World:transitionMusic(next, fade_out)
    -- Compatibility with older versions of transitionMusic which have "next" as the music
    local music = ""
    local volume = 1
    local pitch = 1
    if type(next) == "table" then
        music = next[1]
        volume = next[2]
        pitch = next[3]
    else
        music = next
    end
    --
    if music and music ~= "" then
        if self.music.current ~= music then
            if self.music:isPlaying() and fade_out then
                self.music:fade(0, 10 / 30, function() self.music:stop() end)
            elseif not fade_out and not Game:getFlag("start_cutscene_active_2", false) then
                self.music:play(music, volume, pitch)
            end
        else
            if not self.music:isPlaying() then
                if not fade_out and not Game:getFlag("start_cutscene_active_2", false) then
                    self.music:play(music, volume, pitch)
                end
            else
                self.music:fade(volume)
            end
        end
    else
        if self.music:isPlaying() then
            if fade_out then
                self.music:fade(0, 10 / 30, function() self.music:stop() end)
            else
                self.music:stop()
            end
        end
    end
end

return World