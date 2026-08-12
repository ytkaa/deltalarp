return {
    orchard = function(cutscene, event)
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")
        local music = Music()

        cutscene:detachCamera()
        cutscene:detachFollowers()

        cutscene:slideTo(tofer, "toferpos", 0.5)
        cutscene:walkTo(vess, "vesspos", 1)
        cutscene:wait(cutscene:panTo("camerapos", 1.25))
        cutscene:wait(0.5)

        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] The orchard...")
        cutscene:text("[face:tofer, -19, -13]* Y'know,[wait:5] I've always\nwanted to go here,[wait:5]\ngray brolio.")
        cutscene:text("[face:tofer, -19, -13]* Being amongst apples and \nsuch,[wait:5] it sounds fresh![sound:tofer_checkit]")
        Game.world.music:fade(0, 1.5, function() Game.world.music:pause() end)
        cutscene:text("[face:emotion, -19, -13]* Heh.[wait:5] But.")
        cutscene:playSound("noise")
        cutscene:setSprite(tofer, "tofer")
        cutscene:wait(1.5)
        cutscene:text("[face:emotionerer, -19, -13]* It's just been too \ndangerous![wait:5] With the \nGARDNER around...")
        cutscene:text("[face:emotionerer, -19, -13]* I...")
        cutscene:text("[face:emotionerer, -19, -13]* ...")
        cutscene:text("[face:emotionerer, -19, -13]* I.[wait:5] Don't even know if\nwe could beat him,\n[wait:5]graystuff.[wait:5] Honest.")
        vess:faceTowards(tofer)
        cutscene:wait(1)
        local choice = cutscene:choicer({"We got\nthis", "We need Sofer \nand Grace"})

        if choice == 1 then
            cutscene:wait(1)
            cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Well.")
            cutscene:text("[face:emotionerer, -19, -13]* Hope you're right,[wait:5]\ngray brolio...")
            cutscene:wait(1)
            cutscene:text("[face:tofer, -19, -13]* Heh!")
        else
            cutscene:wait(1)
            cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Well!")
            cutscene:text("[face:tofer, -19, -13]* You're right!")
            cutscene:text("[face:emotion, -19, -13]* It's just...")
            cutscene:text("[face:emotionerer, -19, -13]* I...")
            cutscene:text("[face:emotionerer, -19, -13]* I think SOFER might...")
            cutscene:wait(1)
            cutscene:setAnimation(tofer, "cycle")
            music:play("tofer", 1)
            music:seek(2)
            cutscene:text("[face:tofer, -19, -13]* Heh![wait:5] Whatever am I\nthinking and saying ??!?")
            cutscene:text("[face:tofer, -19, -13]* How could my sweet \n[color:pink]LIL SIS[color:reset] hate ME?")
            cutscene:text("[face:tofer, -19, -13]* Let's bob some apps,[wait:5] \nbrolio![wait:5] Check it![sound:tofer_checkit]")
        end

        cutscene:setAnimation(tofer, "cycle")
        music:stop()
        cutscene:attachCamera()
        cutscene:attachFollowers()
        Game.world.music:resume()
        Game.world.music:fade(1, 1)
    end;

    fallen_tree = function(cutscene, event)
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")

        if (Game:getFlag("axe_pieces", 0)) < 6 then
            if event.interact_count == 1 then
                cutscene:setSpeaker(tofer)
                cutscene:text("[face:emotioner, -19, -13]* Woah,[wait:5] brolio...") --Not finished
            end
        end
    end;
}