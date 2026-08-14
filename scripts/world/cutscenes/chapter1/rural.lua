return {
    start_day = function(cutscene, event)
        --cutscene:text("* (Start the day?)")
        local start = cutscene:textChoicer("* (Start the day?)", {"Yes", "Noooo"})

        if start == 1 then
            --cutscene:text("* (...)")
            --cutscene:text("* (...[wait:5]we haven't implemented\nthat yet.)")
            Game:setFlag("start_cutscene_active", true) --prevents premature room transitions
            cutscene:wait(cutscene:fadeOut(3))
            cutscene:wait(Game.world:mapTransition("chapter1/rural_mainstreet"))
            local music = Music()
            music:play("start")
            music:setLooping(false)
            Game.world.music:stop()
            cutscene:wait(cutscene:fadeIn(1))
            cutscene:wait(cutscene:walkTo("vess", "vess_target_start", 41, "up")) --41, top of mainstreet
            Game:setFlag("start_cutscene_active", false)
            --cutscene:wait(Game.world:mapTransition("chapter1/rural_school"))
            cutscene:wait(0.5)
            Game.world.music:stop()
            Game:setFlag("start_cutscene_active", true)
            cutscene:wait(cutscene:walkTo("vess", "vess_target_start", 4, "up")) --school door
            Game:setFlag("start_cutscene_active", false)
            cutscene:wait(1)
            Game:setFlag("start_cutscene_active", true)
            cutscene:wait(cutscene:walkTo("vess", "vess_target_start", 4, "up")) --top of hallway
            cutscene:wait(cutscene:walkTo("vess", "vess_target_start2", 4, "right")) --right side
            cutscene:walkTo("vess", "vess_target_start3", 4.25, "up")
            cutscene:wait(cutscene:fadeOut(4))
            
            music:stop()
            Game.world:loadMap("chapter1/rural_classroom")
            cutscene:wait(1)
            
            cutscene:gotoCutscene("chapter1/rural.school")
        else
            --cutscene:text("* (Then,[wait:5] the [color:pink][style:GONER]LARPERS' RUNE[color:reset][style:none][wait:5] will\nbe waiting.)")
            cutscene:text("* (Then,[wait:5] it will be waiting.)")
        end
    end;

    school = function(cutscene)
        --Load the map first.
        --cutscene setup
        local walrus = cutscene:getCharacter("walrus")
        local blunderbuss = cutscene:getCharacter("blunderbuss")
        local yoori = cutscene:getCharacter("yoori")
        local handle = cutscene:getCharacter("handle")
        local glaggle = cutscene:getCharacter("glaggle")
        local starwalker = cutscene:getCharacter("starwalker")
        local vess = cutscene:getCharacter("vess")
        local grace = cutscene:getCharacter("grace_lw")
        local tundra = cutscene:getCharacter("tundra_lw")

        cutscene:setSprite(handle, "handle_up")
        cutscene:setSprite(tundra, "up_1")
        cutscene:look(grace, "up")
        cutscene:slideTo(vess, "vess_outbound", 0.1)

        cutscene:wait(2)
        
        cutscene:text("* ...and that's why I prefer the original game.")
        cutscene:text("* Mods just can't beat a classic[wait:5] (haha),[wait:5] well-tailored gaming experience!")

        --cutscene:wait(2)
        Assets.playSound("noise")
        cutscene:fadeIn(0)

        cutscene:setSpeaker(handle)
        cutscene:wait(2)
        cutscene:setSprite(handle, "handle_right")
        cutscene:text("* Am I right,[wait:5] or am I right,[wait:5] Glaggle?")
        cutscene:setSpeaker(glaggle)
        cutscene:wait(1)
        cutscene:text("* Dude.[wait:5] I don't care.")
        Game.world.music:play("class2")
        cutscene:setSprite(handle, "handle_up")
        cutscene:wait(3)
        cutscene:setSpeaker(yoori)
        cutscene:text("[voice:none][sound:yoori]* I love books.")
        cutscene:setSpeaker(tundra)
        cutscene:setTextboxTop(true)
        cutscene:text("[face:smile, -23, -7]* Yo,[wait:5] Starwalker,[wait:5] are you \ncoming to church \ntomorrow?")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:consider, -19, -13]* (Huh.[wait:5] She goes to \nchurch...)")
        cutscene:setSpeaker(starwalker)
        cutscene:text("* Yeah.")
        cutscene:text("* By the way,[wait:5] I like your [color:yellow]fit[color:reset].")
        cutscene:text("* Your sneaks are[wait:5] nice[wait:5] [color:yellow]and[color:reset] original[wait:5]    .")
        cutscene:setSpeaker(tundra)
        cutscene:text("[face:smile_blush_blind, -23, -7]* Ahaha,[wait:5] thanks!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:nervous, -19, -13]* (...)")
        cutscene:look(grace, "right")
        cutscene:text("[face:consider, -19, -13]* Uhhhhhhhh,[wait:5] Tundra.[wait:5]")
        cutscene:setSprite(tundra, "left")
        cutscene:text("[face:snark, -19, -13]* I,[wait:5] uh,[wait:5] also like your,[wait:5] \nuh....")
        cutscene:look(grace, "up")
        cutscene:setSprite(tundra, "up")
        cutscene:setSpeaker(yoori)
        cutscene:setTextboxTop(false)
        cutscene:text("[voice:none][sound:yoori]* I love books!")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* HEH.[wait:5] CAN'T WAIT TO PICK UP CHICKZ AT THE FESTIVAL.")
        cutscene:text("* WITH MY BESTFRIEND.[wait:5] WALRUS.")
        cutscene:setSpeaker(handle)
        cutscene:setSprite(handle, "handle_right")
        cutscene:text("* (Haha),[wait:5] heck yeah![wait:5] My man!")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* ...")
        cutscene:text("* ...")
        cutscene:text("* DUDE I WASN'T $$$$ING TALKING \nTO YOU.")
        cutscene:text("* I WAS TALKING TO WALRUS.")
        cutscene:setSpeaker(walrus)
        --cutscene:text("* Yeah,[wait:5] man. [wait:5] He was talking to me bro watch out.")
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSprite(handle, "handle_up")
        cutscene:setSpeaker(glaggle)
        cutscene:text("* Dude.[wait:5] You guys don't think you're being a little rude?")
        cutscene:setSpeaker(yoori)
        cutscene:text("[voice:none][sound:yoori][next]* I love reading [sound:yoori]books![wait:5] \n[sound:yoori]Especially the")
        cutscene:setSpeaker(glaggle)
        cutscene:text("* Dude.[wait:5] We get it, Yoori.[wait:5] Shut that $$!$ up.")
        cutscene:wait(3)
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* HEY.")
        cutscene:text("* WALRUS.")
        cutscene:wait(2)
        cutscene:text("* WALRUS.")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* ISN'T THAT LIDDLE GRAY PERSON JUST SO WEIRD.")
        cutscene:text("* RIGHT,[wait:5] WALRUS?")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* HEH.[wait:5] YAHHH.")
        cutscene:text("* HEH.[wait:5] I BET EVEN HANDLE THINKS \nSO TOO.")
        cutscene:setSprite(handle, "handle_right")
        cutscene:setSpeaker(handle)
        cutscene:text("* (Haha),[wait:5] I sure do![wait:5] Right on,[wait:5] Blunderbuss!")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSprite(handle, "handle_up")
        cutscene:setSpeaker(glaggle)
        cutscene:text("* Dude.[wait:5] You guys are being so rude.")
        cutscene:text("* ...[wait:5]but you're totally right.[wait:5] That gray person is so creepy.")
        cutscene:text("* I heard that they eat hay and,[wait:5] shudders,[wait:5] walk to school...")
        cutscene:setSpeaker(handle)
        cutscene:setSprite(handle, "handle_right")
        cutscene:text("* I heard they[wait:5] (haha)[wait:5] sleep out \nof a car...[wait:5] and use spray-on shampoo!")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* HEH.[wait:5] YAHHH.")
        cutscene:setSprite(handle, "handle_up")
        cutscene:wait(2)
        cutscene:text("* WALRUS.")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* WATCH THIS.")
        cutscene:text("* HEH.[wait:5] THAT GRAY PERSON SURE IS WEIRD.[wait:5] RIGHT,[wait:5] GRACE?")
        cutscene:wait(2)
        cutscene:text("* HEH.[wait:5] RIGHT,[wait:5] GRACE?")
        cutscene:setSpeaker(grace)
        cutscene:wait(1)
        cutscene:setTextboxTop(true)
        cutscene:text("[face:brow, -19, -13]* Oh.[wait:5] Uh,[wait:5] sure.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:setTextboxTop(false)
        cutscene:text("* HEH.[wait:5] RIGHT.")
        cutscene:text("* ...")
        cutscene:text("* ...[wait:5]YOU GOING TO THE FESTIVAL,[wait:5] SWEETCHEEK?")
        cutscene:setSpeaker(grace)
        cutscene:setTextboxTop(true)
        cutscene:text("[face:sus, -19, -13]* Uh,[wait:5] no.")
        cutscene:text("[face:consider, -19, -13]* (Not with you,[wait:5] anyway...)")
        cutscene:setSpeaker(blunderbuss)
        cutscene:setTextboxTop(false)
        cutscene:text("* HEH.[wait:5] YOU AGREE WITH ME TOO,[wait:5] TUNDRA?")
        cutscene:setSpeaker(tundra)
        cutscene:setTextboxTop(true)
        cutscene:text("[face:stern_b, -23, -7]* Nah.[wait:5] Actually,[wait:5] I think...")
        Game.world.music:stop()
        cutscene:look(vess, "down")
        vess:setPosition(140, 188)
        Assets.playSound("dooropen")
        cutscene:wait(1/8)
        Assets.playSound("doorclose")


        cutscene:wait(3)

        cutscene:setSpeaker(blunderbuss)
        cutscene:setTextboxTop(false)
        cutscene:text("* (OH.)")
        cutscene:setSpeaker(glaggle)
        cutscene:text("* (Dude.)")
        cutscene:setSpeaker(yoori)
        cutscene:text("[voice:none][sound:yoori]* (Books.)")
        cutscene:setSpeaker(handle)
        cutscene:text("* (Ee-ee)...")
        cutscene:wait(cutscene:walkTo(vess, "blush_here", 2))
        cutscene:setSprite(handle, "handle_left_blush")
        cutscene:wait(cutscene:walkTo(vess, "vess_walk", 2))
        --cutscene:setSprite(handle, "handle_blush")
        cutscene:setSprite(handle, "handle_up")
        cutscene:wait(cutscene:walkTo(vess, "vess_walk2", 2))
        cutscene:setSprite(handle, "handle_up")
        cutscene:wait(cutscene:walkTo(vess, "vess_walk3", 1))
        
        cutscene:wait(3)
        Game.world.music:play("class2")

        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* WALRUS.")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("* DID YOU SEE THE HANDBALL GAME LAST NIGHT.")
        cutscene:setSpeaker(walrus)
        cutscene:text("* Yeah,[wait:5] man.")
        cutscene:setSpeaker(blunderbuss)
        cutscene:text("[next][noskip]* HEH.[wait:5] [speed:0.15]YAHHHH[speed:1.5]HHHHHHHHH") --YAHHH
        
        Game.world.music:stop()
        cutscene:fadeOut(0)
        Assets.playSound("bump", 2)
        Game:setFlag("start_cutscene_active", false)
        
        cutscene:wait(1)
        Game.world:loadMap("chapter1/rural_classroom")
        cutscene:wait(1)

        vess = cutscene:getCharacter("vess")
        cutscene:look(vess, "up")
        vess:setPosition(220, 410) --Desk
        cutscene:setSpeaker(nil)
        cutscene:text("* (You fell asleep instantly.)")
        Assets.playSound("doorclose")
        cutscene:wait(1)
        cutscene:text("* (But when you opened your eyes...)")
        cutscene:fadeIn(1)

        --cutscene:text("* (All according[sound:bageldefeat] to[next]")
        --cutscene:text("* [wave][style:GONER](All according to plant!)")
        --cutscene:wait(cutscene:fadeIn(1))
        --cutscene:text("* [wave](oh, you're stuck in the wall...)")
        --cutscene:text("* [wave](oh[wait:5].[wait:5].[wait:5].)")
        --cutscene:wait(Game.world:mapTransition("chapter1/rural_school"))
        --Game:setFlag("start_cutscene_active", false)
        --Assets.playSound("egg")
    end;

    test_school = function(cutscene)
        --cutscene:text("* (Watch the school cutscene \nso far?)")
        local start = cutscene:textChoicer("* (Watch the school cutscene \nso far?)", {"Yes", "Noooo"})

        if start == 1 then
            Game:setFlag("start_cutscene_active", true)
            --cutscene:wait(cutscene:fadeOut(4))
            Assets.playSound("locker")
            cutscene:wait(cutscene:fadeOut(0))
            Game.world.music:stop()
            Game.world:loadMap("chapter1/rural_classroom")
            cutscene:wait(1)

            cutscene:gotoCutscene("chapter1/rural.school")
            
        else
            cutscene:text("* (Then,[wait:5] it will be waiting.)")
        end
    end;

    hungry = function(cutscene, event)
        cutscene:text("* (You're hungry...)")
        cutscene:text("* (You recall taking food from a farm yesterday...)")
        cutscene:text("* (You strongly considered going back today..!)")
    end;

    barn_entrance = function(cutscene, event)
        local vess = cutscene:getCharacter("vess")
        local door = Game.world:getEvent(142)
        local opened = false

        Game.world.timer:every(0.1, function()
            if opened == true then
                --print("We're trying...")
                local smoke = DarkSmoke(340, 310, 5)
                smoke.layer = 666
                Game.world:addChild(smoke)
                smoke:slideTo(math.random(0 - 300, 700 + 300), -5, 5, "out-sine")
            end
        end)

        cutscene:wait(1)
        cutscene:wait(cutscene:walkTo(vess, "center", 2.5, "up"))
        cutscene:wait(2)
        cutscene:look(vess, "right")
        cutscene:wait(1)
        cutscene:look(vess, "down")
        cutscene:wait(1)
        cutscene:look(vess, "left")
        cutscene:wait(1.5)
        cutscene:look(vess, "up")
        cutscene:wait(cutscene:walkTo(vess, "in_front", 3, "up"))
        cutscene:wait(2)

        Assets.playSound("locker")
        Game:setFlag("barn_opened", true)

        --Graphics and vfx. Definitely not the best way to do this but...
        door:setSprite("tilesets/rural/barn_door_open", 1, false)
        door:setPosition(door.x - 68, door.y)
        opened = true
        local darkOverlay = Sprite("dark_overlay", 0, 0, 960, 1240)
        darkOverlay.layer = 667
        darkOverlay.alpha = 0
        Game.world:addChild(darkOverlay)
        darkOverlay:fadeTo(0.3, 4)
        local darkShadow = Sprite("dark_shadow", 296, 100, 128, 240)
        darkShadow.layer = Game.world.player.layer --Jesus
        darkShadow.alpha = 0
        Game.world:addChild(darkShadow)
        darkShadow:fadeTo(0.3, 4)
        cutscene:wait(1)

        Game.world.music:play("the entrance")
        cutscene:wait(cutscene:walkTo(vess, "walk_back", 1, "up", true))
    end;

    barn_opened = function(cutscene, event)
        cutscene:text("* (You can't turn back now...[wait:5] sustenance awaits!)")
    end;
    
    enter_dw = function(cutscene, event)
        Game.world.timer:clear()
        Game.world.timer:after(0.3, function()
            Assets.playSound("wing")
        end)
        Game.world.timer:after(0.6, function()
            Assets.playSound("jump")
        end)
        local vess = cutscene:getCharacter("vess")

        cutscene:detachCamera()
        cutscene:detachFollowers()

        --cutscene:slideTo(kris,  620 - 30, 280, 0.25)
        --cutscene:slideTo(susie, 620 + 30, 280, 0.25)
        --cutscene:panTo(620, 245, 0.25)
        cutscene:wait(0.25)

        vess.visible = false

        local transition = DarkTransition(260, {["movement_table"] = {-1.40, 0}, ["draw_doorblack"] = false, ["skiprunback"] = true})
        --draw_doorblack = false doesn't work because not skipping the runback draws the door regardless. Goodness me!
        transition.loading_callback = function() 
            Game.world:loadMap("chapter1/farm_world/farm1")
            if Game.world.music then
                Game.world.music:stop()
            end
            for _,party in ipairs(Game.party) do
                local char = Game.world:getCharacter(party.id)
                char.visible = false
            end
        end
        transition.layer = 99999

        Game.world:addChild(transition)

        local waiting = true
        local endData = nil
        transition.end_callback = function(transition, data)
            waiting = false
            endData = data
        end

        cutscene:wait(function() return not waiting end)
        
        --if not Game:hasPartyMember("ralsei") then
        --    Game:addPartyMember("ralsei")
        --end

        for _, character in ipairs(endData) do
            local char = Game.world:getPartyCharacterInParty(character.party)
            local kx, ky = character.sprite_1:localToScreenPos(character.sprite_1.width / 2, 0)
            char:setPosition(kx, transition.final_y)
            char.visible = true
            char:setFacing("down")
        end

        cutscene:interpolateFollowers()

        cutscene:attachCamera()
        cutscene:attachFollowers()
    end;

    one_choicer = function(cutscene, event)
        choice = cutscene:choicer({"Vess"})
    end
}