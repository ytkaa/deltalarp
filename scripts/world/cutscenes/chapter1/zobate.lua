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
                cutscene:text("[face:brow, -19, -13]* Okay.")
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
}