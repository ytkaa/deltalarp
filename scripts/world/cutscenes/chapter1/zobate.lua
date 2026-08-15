return {
    mystery_gate = function(cutscene, event)
        if Game.inventory:hasItem("mystery_key") then
            cutscene:text("* (A mysterious gate...)")
            Game.world.music:pause()
            cutscene:text("* (Suddenly,[sound:ghostappear][wait:5] the MysteryKey reacted..!)")
            cutscene:wait(1)
            event:explode(0, 0, false)
            Game:setFlag("zobate_gate1", true)

            cutscene:wait(3)

            local grace = cutscene:getCharacter("grace")
            local tofer = cutscene:getCharacter("tofer")
            if grace then
                cutscene:setSpeaker(grace)
                cutscene:text("[face:wtf, -19, -13]* .")
            elseif tofer then
                cutscene:setSpeaker(tofer)
                cutscene:text("[face:tofer, -19, -13]* Check it![sound:tofer_checkit]")
            end

            cutscene:setSpeaker(nil)
            cutscene:text("* (The MysteryKey was used up.)")
            Game.inventory:removeItem("mystery_key")
            Game.world.music:resume()
        else
            cutscene:text({"* (A mysterious gate...)", "* (It's locked.[sound:awkward])"})
        end
    end;

    treasure_gate = function(cutscene, event)
        if Game.inventory:hasItem("treasure_key") then
            cutscene:text("* (A mysterious gate...[wait:5] it has an aura of treasure.)")
            --Game.world.music:pause()
            cutscene:text("* (Suddenly,[sound:ghostappear][wait:5] the TreasureKey reacted..!)")
            cutscene:wait(1)
            event:explode(0, 0, false)
            Game:setFlag("zobate_gate2", true)

            cutscene:wait(3)

            local grace = cutscene:getCharacter("grace")
            local tofer = cutscene:getCharacter("tofer")
            if grace then
                cutscene:setSpeaker(grace)
                cutscene:text("[face:brow, -19, -13]* Okay.")
            elseif tofer then
                cutscene:setSpeaker(tofer)
                cutscene:text("[face:tofer, -19, -13]* Check it![sound:tofer_checkit]")
            end

            cutscene:setSpeaker(nil)
            cutscene:text("* (The TreasureKey was used up.)")
            Game.inventory:removeItem("treasure_key")
            --Game.world.music:resume()
        else
            cutscene:text({"* (A mysterious gate...[wait:5] it has an aura of treasure.)", "* (It's locked.[sound:awkward])"})
        end
    end;

    barn_gate = function(cutscene, event)
        if Game.inventory:hasItem("barn_key") then
            cutscene:text("* (A mysterious gate...[wait:5] it has an aura of barn.)")
            --Game.world.music:pause()
            cutscene:text("* (Suddenly,[sound:ghostappear][wait:5] the BarnKey reacted..!)")
            cutscene:wait(1)
            event:explode(0, 0, false)
            Game:setFlag("zobate_gate3", true)

            cutscene:wait(3)

            local grace = cutscene:getCharacter("grace")
            if grace then
                cutscene:setSpeaker(grace)
                cutscene:text("[face:neutral, -19, -13]* ...")
                cutscene:wait(1)
                cutscene:text("[face:angry_mark, -19, -13]* This $$!$ better be \nworth it !!!")
            end

            cutscene:setSpeaker(nil)
            cutscene:text("* (The BarnKey was used up.)")
            Game.inventory:removeItem("barn_key")
            --Game.world.music:resume()
        else
            cutscene:text({"* (A mysterious gate...[wait:5] it has an aura of barn.)", "* (It's locked.[sound:awkward])"})
        end
    end;

    colonels_dip = function(cutscene, event)
        local mainColonel = Game.world.followers[1]
        if #Game.party > 1 then mainColonel = Game.world.followers[2] end
        local followers = Game.world.followers
        cutscene:setTextboxTop(true)
        cutscene:setSpeaker(mainColonel, true)
        cutscene:setSprite(mainColonel, "talk", 1/6)
        cutscene:text("* Ah,[wait:5] lieutenant...")
        cutscene:wait(1)
        cutscene:shakeCharacter(mainColonel)
        Assets.playSound("bump")
        cutscene:wait(0.5)
        cutscene:text("* WE CAN'T BE IN THIS AREA !!!")
        cutscene:setSpeaker(Game.world.followers[3], true)
        cutscene:setSprite(mainColonel, "idle")
        cutscene:setSprite(Game.world.followers[3], "talk", 1/6)
        local x,y = Game.world.followers[3]:getScreenPos()
        if y > SCREEN_HEIGHT then
            cutscene:slideTo(Game.world.followers[3], mainColonel.x + 50, mainColonel.y, 0.25)
        end
        cutscene:text("* We've been actively avoiding it,[wait:5] soldier!")
        cutscene:setSpeaker(mainColonel, true)
        cutscene:setSprite(Game.world.followers[3], "idle")
        cutscene:setSprite(mainColonel, "talk", 1/6)
        cutscene:text("* GOODBYE,[wait:5] lieutenant !!")

        cutscene:wait(cutscene:fadeOut(1))
        Assets.playSound("escaped")
        cutscene:setSprite(mainColonel, "idle")
        for _, follower in pairs(followers) do
            if follower:getPartyMember() == nil then
                Game.world:removeFollower(follower)
                follower:remove()
            end
        end
        for _, follower in pairs(followers) do
            if follower:getPartyMember() == nil then
                Game.world:removeFollower(follower)
                follower:remove()
            end
        end
        for _, follower in pairs(followers) do
            if follower:getPartyMember() == nil then -- It's even worse now.
                Game.world:removeFollower(follower)
                follower:remove()
            end
        end
        Game:setFlag("leading_colonels_squad", false)
        cutscene:wait(1)
        cutscene:fadeIn(1)
    end;

    show = function(cutscene, event)
        local vess = cutscene:getCharacter("vess")
        local grace = cutscene:getCharacter("grace")
        local camera = Game.world.camera

        cutscene:detachCamera()
        cutscene:detachFollowers()

        local speak = function(speaker, text)
            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        cutscene:walkTo(vess, "vesspos", 2, nil, nil)
        cutscene:panTo(460, 975, 1.5)
        cutscene:wait(cutscene:walkTo(grace, "gracepos", 2, nil, nil, "out-quad"))
        

        cutscene:wait(1)

        speak(grace, "[face:consider, -19, -13]* Huh.")
        cutscene:wait(cutscene:panTo(460, 730, 1))
        cutscene:wait(2)
        speak(grace, "[face:consider, -19, -13]* There's a stage here.")
        cutscene:panTo(camera.x, 900, 1.5)
        --cutscene:wait(cutscene:walkTo(vess, "vesspos2", 1))
        cutscene:wait(0.5)
        cutscene:look(vess, "right")
        cutscene:wait(0.5)
        cutscene:look(grace, "left")
        cutscene:wait(0.5)
        speak(grace, "[face:angry, -19, -13]* That's it ??!?[wait:5] What the\n$$$$ ??!?")
        --cutscene:walkTo(grace, grace.x, grace.y + 65, 1.5)
        cutscene:setSprite(grace, "down_angry")
        speak(grace, "[face:angry_mark, -19, -13]* We have MORE IMPORTANT \n$$!$ to do and look\nat than...[wait:5] this STAGE !!")
        cutscene:wait(1)
        cutscene:resetSprite(grace)
        cutscene:look(grace, "left")
        speak(grace, "[face:brow, -19, -13]* Huh?[wait:5] There's a show \nhappening soon?")
        cutscene:wait(0.5)
        cutscene:look(grace, "right")
        cutscene:wait(0.5)
        speak(grace, "[face:consider, -19, -13]* ...")
        cutscene:wait(0.5)
        cutscene:look(grace, "left")
        cutscene:wait(0.5)
        speak(grace, "[face:angry_mark, -19, -13]* We need to get\nseated NOW !!!")
        cutscene:setAnimation(grace, "walk/left", 1/6)
        speak(grace, "[face:kawaii_brow, -19, -13]* I love musical theatre!")
        
        cutscene:playSound("cardrive")
        cutscene:look(grace, "left")
        cutscene:look(vess, "right")
        cutscene:slideTo(grace, "seat_right", 1.5, "out-back")
        cutscene:slideTo(vess, "seat_left", 1.5, "out-back")

        cutscene:wait(cutscene:panTo(460, 730, 2))
        cutscene:wait(1)

        speak(grace, "[face:brow, -19, -13]* I'm just,[wait:5] uhh...")
        speak(grace, "[face:consider, -19, -13]* ...assuming.[wait:5] This is \nmusical theatre.")
        

        local curtain_left = Game.world:getEvent(39)
        local curtain_right = Game.world:getEvent(40)
        
        cutscene:slideTo(curtain_left, curtain_left.x - 200, curtain_left.y, 5, "out-sine")
        cutscene:wait(cutscene:slideTo(curtain_right, curtain_right.x + 200, curtain_right.y, 5, "out-sine"))

        cutscene:wait(3)
        cutscene:playSound("cardrive")

        local zobate = cutscene:spawnNPC("zobate", 460, 650)
        zobate.sprite.alpha = 0
        zobate:setScaleOrigin(0.5, 0.5)
        zobate:setScale(0.5, 0.5)

        zobate.sprite:fadeTo(1, 1.5)
        Game.world.timer:tween(1.5, zobate, {scale_x = 2, scale_y = 2}, "out-sine")
        cutscene:wait(3)

        local chair_left = Game.world:getEvent(13)
        local chair_right = Game.world:getEvent(14)

        cutscene:startEncounter("zobate", nil, {{"zobate", zobate}}, {["wait"] = false})

        chair_left:remove()
        chair_right:remove()

        --cutscene:slideTo(chair_left, 150 - 40, 280 + 20, 1)
        --cutscene:slideTo(chair_right, 150 - 40, 280 + 20, 1)

    end;
}