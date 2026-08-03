return function(event, player, facing)
    if Game:getFlag("shovel_lines", false) then
        Game:setFlag("shovel_lines", false)

        local shovelQuest = Game:getFlag("shovel_quest", 0)
        local shovel = Game.world:getCharacter("shovel")
        local offset = -100
        local chara = Game.world.player

        if shovel then
            if chara.x > shovel.x then offset = 60 end

            local fadeOut = 2

            local say = function(text, talkSpeed)
                local line = DialogueText("[noskip][voice:none][speed:0.5][talk:true]" .. text, shovel.x + offset, shovel.y - 100, 100, 100, {["font_size"] = 16, ["line_offset"] = -8})
                shovel.sprite:play(talkSpeed or (1/5), true)
                line.layer = shovel.layer + 1
                return line
            end

            local fade = function(text, time)
                text.alpha = 0
                text:fadeTo(1, 0.5, function() Game.world.timer:after(time, function() text:fadeOutAndRemove(fadeOut) shovel.sprite:stop() end) end)
            end

            if shovelQuest == 2 then
                --print("We're on 2")
                local text = say("I am\ncontent\nwith staying\nhere...")
                Game.world:addChild(text)
                fade(text, 3)
                Game.world.timer:after(3 + fadeOut, function()
                    text = say("...if the carrot is\nto [wait:5]\"help\"[wait:5] me.")
                    Game.world:addChild(text)
                    fade(text, 3)
                end)
            elseif shovelQuest == 3 then
                --print("We're on 3")
                local text = say("Oh,[wait:5] how I wish\nI possessed talent...")
                Game.world:addChild(text)
                fade(text, 3)
                Game.world.timer:after(3 + fadeOut, function()
                    text = say("...outside of shovel-\nitudes!")
                    Game.world:addChild(text)
                    fade(text, 3)
                    Game.world.timer:after(3 + fadeOut, function() --Holy timers
                        text = say("Oh,[wait:5] welph...")
                        Game.world:addChild(text)
                        fade(text, 1.5)
                    end)
                end)
            elseif shovelQuest == 4 then
                --print("We're on 4")
                local text = say("I'm\ngetting\nantsy...", 1/6)
                Game.world:addChild(text)
                fade(text, 3)
                Game.world.timer:after(3 + fadeOut, function()
                    text = say("...[color:pink]GRAY PERSON[color:reset],[wait:5]\nassist me!", 1/6)
                    Game.world:addChild(text)
                    fade(text, 3)
                end)
            else
                local text = say("HELP ??!?", 1/7)
                fade(text, 1.5)
                Game.world:addChild(text)
                --print("We're over 4")
            end
        end
    end
end