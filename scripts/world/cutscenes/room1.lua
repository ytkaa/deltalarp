return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `WorldCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene WorldCutscene
    wall = function(cutscene, event)
        -- Open textbox and wait for completion
        cutscene:text("* (The wall seems cracked.[wait:5] Maybe it trades on Quado..?)")
        cutscene:text("* (No...[wait:5] not something like this.)")

        -- If we have Susie, play a cutscene
        local susie = cutscene:getCharacter("susie")
        if susie then
            -- Detach camera and followers (since characters will be moved)
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- All text from now is spoken by Susie
            cutscene:text("* (...[wait:5]you have a feeling Susie is about to do something dumb.)")
            cutscene:setSpeaker(susie)
            cutscene:text("* Hey,[wait:5] think I can break\nthis wall?", "smile")

            -- Get the bottom-center of the broken wall
            local x = event.x + event.width / 2
            local y = event.y + event.height / 2

            -- Move Susie up to the wall over 0.75 seconds
            cutscene:walkTo(susie, x, y + 40, 0.75, "up")
            -- Move other party members behind Susie
            cutscene:walkTo(Game.world.player, x, y + 100, 0.75, "up")
            if cutscene:getCharacter("ralsei") then
                cutscene:walkTo("ralsei", x + 60, y + 100, 0.75, "up")
            end
            if cutscene:getCharacter("noelle") then
                cutscene:walkTo("noelle", x - 60, y + 100, 0.75, "up")
            end

            -- Wait 1.5 seconds
            cutscene:wait(1.5)

            -- Walk back,
            cutscene:wait(cutscene:walkTo(susie, x, y + 60, 0.5, "up", true))
            -- and run forward!
            cutscene:wait(cutscene:walkTo(susie, x, y + 20, 0.2))

            -- Slam!!
            Assets.playSound("impact")
            susie:shake(4)
            susie:setSprite("shock_up")

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)

            -- owie
            susie:setAnimation({ "away_scratch", 0.25, true })
            susie:shake(4)
            Assets.playSound("wing")

            cutscene:wait(1)
            cutscene:text("* Guess not.", "nervous")

            -- Reset Susie's sprite
            susie:resetSprite()

            -- Reattach the camera
            cutscene:attachCamera()

            -- Align the follower positions behind Kris's current position
            cutscene:alignFollowers()
            -- And reattach them, making them return to their target positions
            cutscene:attachFollowers()
            Game:setFlag("wall_hit", true)
        end
    end;

    grace_voice_test = function(cutscene)
        cutscene:text("[voice:grace]* Hey,[wait:5] hey![wait:5] Look at me![wait:5] I'm GRACE,[wait:5] and I sound like this,[wait:5] mew~")
        cutscene:text("[voice:susie]* And I'm Susie.[wait:5]")
        local susie = cutscene:spawnNPC("susie", 690, 240)
        cutscene:wait(cutscene:walkTo(susie, "susie_walk", 0.8))
        cutscene:setSpeaker(susie)
        cutscene:text("* Heh,[wait:5] you couldn't see \nmy portrait...", "smirk")
        cutscene:text("* 'Cause I wasn't on screen!", "sincere_smile")
        cutscene:text("[voice:grace]* Who the $$$$ are you ??!?")
        Assets.playSound("dtrans_square")
        cutscene:wait(cutscene:slideTo(susie, "susie_spawn", 0.4))
        susie:remove()
    end;
}
