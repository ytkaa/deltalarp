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
}