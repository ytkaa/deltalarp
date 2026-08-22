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
        local choice = cutscene:choicer({"We need Sofer \nand Grace", "Dude we need \nSofer and Grace"})

        -- * If you haven't gotten it by now... your choices don't matter.
        if choice == 1 then
            --cutscene:wait(1)
            --cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Well.")
            --cutscene:text("[face:emotionerer, -19, -13]* Hope you're right,[wait:5]\ngray brolio...")
            --cutscene:wait(1)
            --cutscene:text("[face:tofer, -19, -13]* Heh!")
        else
            
        end

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
        local music = Music()

        --Heh. You know... the orchard wasn't as dangerous as I thought, brolio.
        --Maybe this whole GARDNER thing is a hoax!
        --We should just chill and brill for real.

        if (Game:getFlag("axe_pieces", 0)) < 6 then
            if event.interact_count == 1 then
                Game.world.music:fade(0, 1, function() Game.world.music:pause() end)
                cutscene:setSpeaker(tofer)
                cutscene:text("[face:emotioner, -19, -13]* Woah,[wait:5] brolio...")
                cutscene:text("[face:emotioner, -19, -13]* This tree,[wait:5] brolio...")
                cutscene:text("[face:emotioner, -19, -13]* Think it fell,[wait:5] brolio...")
                cutscene:text("[face:emotioner, -19, -13]* What do we do,[wait:5] brolio..?")
                vess:faceTowards(tofer)
                cutscene:choicer({"Chop", "Chop"})
                music:play("tofer", 1)
                music:seek(2)
                cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Check it![sound:tofer_checkit][wait:5]\nYou always have luminous \nideas,[wait:5] brolio!")
                cutscene:text("[face:tofer, -19, -13]* Let's check[sound:tofer_checkit][wait:10] around for.[wait:5]\nSomething to Chop!")
                music:stop()
                cutscene:setSpeaker(nil)
                cutscene:text("[noskip]* ([sound:cd_bagel/noelle][color:yellow]NEW QUEST[color:reset]:[wait:20] Chop [color:green]FALLEN TREE[color:reset]!)[wait:1s]", nil, nil)
                Game.world.music:resume()
                Game.world.music:fade(1, 1)
            else
                cutscene:setSpeaker(tofer)
                cutscene:text("[face:tofer, -19, -13]* Check it,[sound:tofer_checkit][wait:5] graystuff![wait:5]\nWe don't have any\nTools to Chop!")
            end
        end
    end;

    individual = function(cutscene, event)
        local individual = cutscene:getCharacter("cherries")
        local vess = cutscene:getCharacter("vess")
        local tofer = cutscene:getCharacter("tofer")
        local music = Music()

        local speak = function(speaker, text)
            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        cutscene:detachFollowers()

        individual:setPosition(individual.x, vess.y)
        Game.world.music:pause()

        cutscene:playSound("dtrans_square")
        cutscene:wait(cutscene:slideTo(individual, vess.x - 50, vess.y, 0.75, "out-bounce"))
        cutscene:wait(1)
        speak(individual, "* Ey.")
        cutscene:slideTo(individual, individual.x, 280, 1)
        cutscene:wait(cutscene:walkTo(vess, vess.x, 280, 1, "left", true))
        speak(individual, "* Ey,[wait:5] kid.")
        cutscene:slideTo(individual, individual.x, 280 + 60, 1)
        cutscene:wait(cutscene:walkTo(vess, vess.x, 280 + 60, 1, "left", true))
        cutscene:slideTo(individual, individual.x, 280 - 60, 1)
        cutscene:wait(cutscene:walkTo(vess, vess.x, 280 - 60, 1, "left", true))
        cutscene:slideTo(individual, individual.x, 280 + 60, 0.5)
        cutscene:wait(cutscene:walkTo(vess, vess.x, 280 + 60, 0.5, "left", true))
        cutscene:slideTo(individual, individual.x, 280, 1)
        cutscene:wait(cutscene:walkTo(vess, vess.x, 280, 1, "left", true))
        speak(individual, "* Kid.")
        cutscene:wait(1)
        cutscene:wait(cutscene:walkTo(vess, vess.x + 50, 280, 2))
        cutscene:wait(1)
        cutscene:slideTo(individual, individual.x, 380, 0.2)
        cutscene:wait(cutscene:walkTo(vess, vess.x - 50, 380, 0.2, "left", true))
        speak(individual, "* Ey.")
        music:play("individual")
        cutscene:wait(2)

        speak(individual, "* Ey,[wait:5] kid.")
        speak(individual, "* ...[wait:5]I got sumnth for ya.[wait:5] Kid.")
        speak(individual, "* ...[wait:5]wanna buy?")
        cutscene:showShop()
        local choice_1 = cutscene:choicer({"Sure", "No ??!?"})
        cutscene:hideShop()

        if choice_1 == 1 then
            speak(individual, "* Kid...")
            speak(individual, "* Heh...[wait:5] you're real eager,[wait:5] huh?")
            speak(individual, "* Heheh...[wait:5] heh.")
            speak(individual, "* Heh...[wait:5] heh...")
            speak(individual, "* ...")
            speak(individual, "* That's bad.[wait:5] I din't even give a price yet.")
            speak(individual, "* Ya gotta let us EARN this deal,[wait:5] kid.")
            music:stop()
            speak(individual, "* I mean me.[wait:5] Let ME earn this deal,[wait:5] kid.")
        else
            cutscene:slideTo(individual, individual.x, 300, 1)
            cutscene:wait(cutscene:walkTo(vess, vess.x, 300, 1, "left", true))
            speak(individual, "* Kid...[wait:5] heheh.")
            speak(individual, "* You don't even knoe what I'm selling,[wait:5] kid...")
            speak(individual, "* Give us a chance,[wait:5] kid.")
            music:stop()
            speak(individual, "* Er...")
            speak(individual, "* Give ME a chance,[wait:5] kid.")
        end

        speak(individual, "* There's...[wait:5] er...[wait:5] there's only one a me.")
        speak(individual, "* One cherry.[wait:5] In 'ere.")
        speak(individual, "* ...yeah.")
        cutscene:wait(2)
        speak(tofer, "[face:tofer, -19, -13][next]* Che[sound:tofer_checkit]ck it!")
        Assets.stopSound("tofer_checkit", true)
        speak(individual, "* Let's restart.")
        music:play("individual")
        speak(individual, "* Ey,[wait:5] kid.")
        speak(individual, "* ...[wait:5]I got sumnth for ya.[wait:5] Kid.")
        speak(individual, "* ...[wait:5]wanna buy?")

        cutscene:showShop()
        -- Interruption choicer...
        local wait = cutscene:choicer({"Sure", "No ??!?"}, {["wait"] = false})
        local timer = 0
        while timer < 0.5 do
            local chosen, chosen_n = wait(cutscene)
            if chosen then
                break
            end
            timer = timer + DT
            cutscene:wait()
        end
        cutscene:hideShop()

        speak(individual, "* 'CAUSE.")
        speak(individual, "* 'Cause it's sumnth real good,[wait:5] kid...")
        speak(individual, "* Heh,[wait:5] I know yor gonna want it,[wait:5] kid...")
        local choice_2 = cutscene:choicer({"Buy", "How much"})

        if choice_2 == 1 then
            music:stop()
            speak(individual, "* LOOK,[wait:5] KID.[wait:5] IT'S A [color:red]THOUSAND BUSKS[color:reset].")
            speak(individual, "* KID.[wait:5] DO YOU REALLY WANT TO SPEND A [color:red]THOUSAND BUSKS[color:reset] ON THIS.[wait:5] KID.")
            cutscene:showShop()
            cutscene:setSpeaker(nil)
            local choice_spend = cutscene:textChoicer("* (Spend a thousand busks on it?)", {"Spend", "Nah"})
            cutscene:hideShop()

            if choice_spend == 1 then
                if Game.money >= 1000 then
                    -- If they have the money, try to give them the rhapsotea item
                    if Game.inventory:tryGiveItem("cherrybomb") then
                        -- Play the equip SFX
                        Assets.playSound("equip")
                        -- Subtract the money if the player got the item
                        Game.money = Game.money - 1000
                        speak(nil, "* (You got a CherryBomb...)")
                        cutscene:shakeCharacter(individual, 4)
                        speak(individual, "* Heheheh.")
                        cutscene:shakeCharacter(individual, 5)
                        speak(individual, "* Heheheh!")
                        cutscene:shakeCharacter(individual, 6, 7)
                        speak(individual, "* HEHEHEH!")
                        music:play("individual")
                        speak(individual, "* Welff![wait:5] A deal's a deal,[wait:5] kid!")
                        speak(individual, "* Heheh...[wait:5] looks like the cherries ARE back in brow after all...")
                        speak(individual, "* Ey,[wait:5] you go kid around and enjoy that thing,[wait:5] huh?")
                    else
                        -- If the player inventory and storage is full, don't subtract any money
                        speak(nil, "[sound:error][wait:5]* (You're carrying too much.)")

                        speak(individual, "* Kid.")
                        speak(individual, "* Kid.[wait:5] I-I think it's better for the all of us that you couldn't buy it.")
                        speak(individual, "* I mean the both of us.")
                        
                    end
                else
                    -- If the player doesn't have enough money
                    speak(nil, "[sound:error][wait:5]* (You don't have enough money...)")

                    speak(individual, "* Kid.")
                        speak(individual, "* Kid.[wait:5] I-I think it's better for the all of us that you couldn't buy it.")
                        speak(individual, "* I mean the both of us.")
                end
            else
                speak(individual, "* Kid.")
                speak(individual, "* Kid.[wait:5] I-I think it's better for the all of us that you din't buy it.")
                speak(individual, "* I mean the both of us.")
            end
        else
            speak(individual, "* Heh...[wait:5] kid...")
            speak(individual, "* It's only...")
            speak(individual, "* It's only...")
            speak(individual, "* Heh.[wait:5] It's only a [color:red]thousand busks[color:reset],[wait:5] kid!")
            cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "left", true))
            speak(individual, "* That's a STEAL,[wait:5] kid!")
            cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "left", true))
            speak(individual, "* It'll change your LIFE,[wait:5] kid!")
            cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "left", true))
            speak(individual, "[next]* We need this,[wait:5] kid!")
            cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "left", true))
            speak(individual, "* I need this,[wait:5] kid!")
            cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "left", true))
            music:stop()
            speak(individual, "* JUST TAKE THE DEAL,[wait:5] KID!")

            cutscene:showShop()
            cutscene:setSpeaker(nil)
            local choice_spend = cutscene:textChoicer("* (Take the deal for a [color:red]thousand busks[color:reset]?)", {"Deal", "No deal"})
            cutscene:hideShop()

            if choice_spend == 1 then
                if Game.money >= 1000 then
                    -- If they have the money, try to give them the rhapsotea item
                    if Game.inventory:tryGiveItem("cherrybomb") then
                        -- Play the equip SFX
                        Assets.playSound("equip")
                        -- Subtract the money if the player got the item
                        Game.money = Game.money - 1000
                        speak(nil, "* (You got a CherryBomb...)")
                        cutscene:shakeCharacter(individual, 4)
                        speak(individual, "* Heheheh.")
                        cutscene:shakeCharacter(individual, 5)
                        speak(individual, "* Heheheh!")
                        cutscene:shakeCharacter(individual, 6, 7)
                        speak(individual, "* HEHEHEH!")
                        music:play("individual")
                        speak(individual, "* Welff![wait:5] A deal's a deal,[wait:5] kid!")
                        speak(individual, "* Heheh...[wait:5] looks like the cherries ARE back in brow after all...")
                        speak(individual, "* Ey,[wait:5] you go kid around and enjoy that thing,[wait:5] huh?")
                    else
                        -- If the player inventory and storage is full, don't subtract any money
                        speak(nil, "[sound:error][wait:5]* (You're carrying too much.)")

                        speak(individual, "* You're worthless,[wait:5] kid!")
                    end
                else
                    -- If the player doesn't have enough money
                    speak(nil, "[sound:error][wait:5]* (You don't have enough money...)")

                    speak(individual, "* You're worthless,[wait:5] kid!")
                end
            else
                speak(individual, "* You're hopeless,[wait:5] kid!")
            end
        end

        music:stop()
        cutscene:wait(2)
        speak(individual, "* Doose!")
        cutscene:playSound("dtrans_square")
        cutscene:wait(cutscene:slideTo(individual, -100, individual.y, 0.50, "linear"))

        cutscene:wait(4)
        speak(tofer, "[face:tofer, -19, -13]* Heh.[wait:5] What the hell?")

        Game.world.music:resume()
        cutscene:attachCamera()
        cutscene:alignFollowers()
        cutscene:attachFollowers()
    end;

    rabbit = function(cutscene, event)
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")
        local bunny = cutscene:getCharacter("bluebunny")
        local jenga = Game.world:getEvent(13)
        local music = Music()

        local speak = function(speaker, text, shake)
            if shake then
                cutscene:playSound("wing")
                cutscene:shakeCharacter(speaker)
            end

            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        local timer = Game.world.timer
        --timer:everyInstant(3, function()
        --    cutscene:playSound("wing")
        --    cutscene:shakeCharacter(bunny)
        --end)

        cutscene:detachFollowers()

        speak(tofer, "[next][speed:1.5][face:tofer, -19, -13]* [sound:tofer_checkit]Check it![wait:2] \nThat's BLUEBUNNY!")
        Assets.stopSound("tofer_checkit", true)
        Game.world.music:pause()
        speak(bunny, "* Wait,[wait:5] wait,[wait:5] WAIT..!", true)
        speak(bunny, "* This is really important..!", true)
        speak(bunny, "* I'm doing something really important right now..![wait:5] Just gimme a sec..!", true)
        cutscene:wait(1)
        speak(bunny, "* I need it quiet right now..![wait:5] This is important..!", true)
        cutscene:wait(2)
        cutscene:playSound("step2")
        cutscene:wait(cutscene:walkTo(vess, vess.x + 25, vess.y, 0.2, "right", true))
        Assets.stopSound("step2", true)
        bunny.sprite.anim_speed = 1.5
        speak(bunny, "* DO NOT make a sound..!", true)
        speak(bunny, "* I heard your footstep..![wait:5] It's really distracting..!", true)
        speak(bunny, "* Please..! Just one more second..!", true)
        cutscene:wait(2)
        cutscene:playSound("drive")
        cutscene:wait(cutscene:slideTo(tofer, tofer.x + 25, tofer.y, 0.2))
        Assets.stopSound("drive", true)
        bunny.sprite.anim_speed = 2
        speak(bunny, "* Oh,[wait:5] come on,[wait:5] man..![wait:5] Not the UNICYCLE..!", true)

        bunny.sprite.anim_speed = 4
        cutscene:playSound("wing")
        cutscene:shakeCharacter(bunny)
        cutscene:wait(0.3)
        cutscene:playSound("wing")
        cutscene:shakeCharacter(bunny)
        cutscene:wait(0.3)
        cutscene:playSound("wing")
        cutscene:shakeCharacter(bunny)
        cutscene:wait(1)
        cutscene:playSound("noise")
        bunny.sprite:stop(true)
        tofer.sprite:pause()


        --Not done yet
        cutscene:wait(2)
        cutscene:playSound("bell_bounce_short")
        jenga:shake()
        cutscene:wait(0.5)
        jenga:setRotationOrigin(0.5, 1)
        jenga.rotation = (3*math.pi)/2 --Trig
        cutscene:playSound("explosion")
        Game:setFlag("jenga_tower_fell", 1)
        
        if vess.x >= 180 and vess.y >= 320 then --If vess is inside the jenga tower
            vess.noclip = true
            cutscene:walkTo(vess, 125, vess.y, 0.3, "right", true, "linear", function() vess.noclip = false end)
        end

        cutscene:wait(1)
        cutscene:setSprite(bunny, "stool_agast")
        speak(bunny, "* NOOOOOOO..![wait:5] MY PLAYTHINGS..!", true)
        speak(bunny, "* OH MY LORD..![wait:5] $$$$.", true)
        speak(bunny, "* $$$$..!", true)
        speak(bunny, "* I'VE BEEN WORKING ON THIS FOR DAYS..!", true)
        speak(bunny, "* $$$$$$$$$$$$$..!", true)
        cutscene:wait(1)
        --rabbit turns left
        speak(bunny, "* $$$$..!", true)
        speak(bunny, "* I don't even CARE anymore..!", true)
        speak(bunny, "* Just whatever.", true)
        speak(bunny, "* WHATEVER..!", true)
        
        tofer.sprite:resume()
        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        cutscene:alignFollowers()
    end;

    rabbit_talk = function(cutscene, event)
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")
        local bunny = cutscene:getCharacter("bluebunny")

        local speak = function(speaker, text, shake)
            if shake then
                cutscene:playSound("wing")
                cutscene:shakeCharacter(speaker)
            end

            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        local noise = function(sound)
            cutscene:playSound(sound)
            cutscene:wait(0.3)
        end

        if Game:getFlag("jenga_tower_fell", 0) == 1 then
            speak(bunny, "* Don't talk to me.", true)

            cutscene:playSound("wing")
            cutscene:shakeCharacter(vess)
            cutscene:wait(0.2)
            cutscene:playSound("wing")
            cutscene:shakeCharacter(tofer)
        elseif Game:getFlag("jenga_tower_fell", 0) == 2 then
            local noises = {"drive", "step2", "badexplosion", "alert", "bageldefeat", "bell", "bigcut", "bloomer", "bluh", "tofer_checkit", "tofer_heh", "camera_flash"
        , "cd_bagel/susie", "egg", "icespell", "ominous", "ominous_cancel"}
            
            if event.interact_count < 2 then
                speak(bunny, "* Yeah,[wait:5] I was being a little dramatic earlier.", true)
                speak(bunny, "* Make as much noise as you want..!", true)
            else
                cutscene:playSound("wing")
                cutscene:wait(cutscene:shakeCharacter(bunny))
            end

            cutscene:enableMovement()
            Game.world.music:pause()

            local count = 0

            while count < 8 do
                noise(Utils.pick(noises, nil, true))
                count = count + 1
            end

            Game.world.music:resume()
        end
    end;

    painting = function(cutscene, event)
        local grace = cutscene:spawnNPC("grace", 240, 260)
        local sofer = cutscene:spawnNPC("sofer", 320, 260)
        local vess = cutscene:getCharacter("vess")
        local tofer = cutscene:getCharacter("tofer")
        local music = Music()
        local motorcycle = Game.world:getEvent(25)

        local speak = function(speaker, text)
            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        cutscene:detachFollowers()
        cutscene:detachCamera()
        Game.world.music:fade(0, 1, function() Game.world.music:stop() end)

        Game.world.timer:after(0.5, function()
            music:play("whoot3", 0)
            music:fade(1, 1)
        end)

        cutscene:wait(cutscene:panTo(360, Game.world.camera.y, 2, "out-sine"))

        speak(sofer, "* Aw.[wait:5] Motorcycles are actually lame.")
        speak(sofer, "* You can't even drive them!")
        grace:faceTowards(sofer)
        speak(grace, "[face:consider, -19, -13]* Uhh,[wait:5] you mean,[wait:5] like...")
        speak(grace, "[face:brow, -19, -13]* ...[wait:5]specifically YOU?")
        speak(grace, "[face:snark, -19, -13]* Because YOU told me \nfive minutes ago you \ncan't drive at all.")
        cutscene:look(grace, "down")
        speak(sofer, "* Yeah !!![wait:5] But,[wait:5] YOU,[wait:5] Grace...??!?")
        speak(sofer, "* Someone as cool as YOU should always be seen and pictured on a motorcycle !!!")
        grace:faceTowards(sofer)
        speak(grace, "[face:consider, -19, -13]* ...[wait:5]huh.")
        speak(grace, "[face:nervous, -19, -13]* Uhh.[wait:5] Well,[wait:5] $$!$,[wait:5] uhh,[wait:5]\nthing is...")
        speak(grace, "[face:sad_brow_but_not_really_sad, -19, -13]* ...[wait:5]I've never drove a \nMOTORCYCLE before.")
        speak(grace, "[face:snark, -19, -13]* Even though I definitely \ncould !!!")
        speak(grace, "[face:consider, -19, -13]* But,[wait:5] like,[wait:5] I don't \nknow...")
        speak(grace, "[face:neutral, -19, -13]* ...[wait:5]if I'd even want to.")
        cutscene:look(grace, "down")
        cutscene:wait(1)
        grace:faceTowards(sofer)
        speak(grace, "[face:brow, -19, -13]* I've probably worked...\n[wait:5]way too hard in my \nlife...")
        cutscene:look(grace, "down")
        speak(grace, "[face:pissed, -19, -13]* ...[wait:5]to maybe throw it all \naway riding a $$$$ing \nmotorcycle.")
        cutscene:wait(1)
        grace:faceTowards(sofer)
        speak(grace, "[face:brow, -19, -13]* Y'know?")
        music:stop()
        cutscene:setSprite(sofer, "neutral")
        cutscene:wait(2)
        speak(sofer, "* Damn.")
        cutscene:wait(2)
        music:play("whoot3", 1, 1.2)
        cutscene:setSprite(sofer, "talk", 1/4)
        speak(sofer, "* That's sick.")
        sofer.sprite.anim_speed = 1.5
        music:setPitch(1.25)
        speak(sofer, "* That's so COOL!")
        sofer.sprite.anim_speed = 2
        music:setPitch(1.3)
        speak(sofer, "* $$$$ motorcycles!")
        motorcycle:explode(0, 0, true)
        motorcycle:shake()
        speak(sofer, "* I want to work hard in my life too!")
        speak(sofer, "* You really are the COOLEST!")
        speak(grace, "[face:wtf, -19, -13]* Uhhhh,[wait:5] well...")
        music:stop()

        tofer:setPosition(720, 300)
        vess:setPosition(820, 320)
        cutscene:look(vess, "left")

        speak(tofer, "* Heh![wait:5] Check it![sound:tofer_checkit]")
        sofer.sprite.anim_speed = 1
        sofer:setSprite("cannot")
        cutscene:wait(cutscene:panTo(360 + 150, Game.world.camera.y, 1))
        music:play("tofer", 1)
        music:seek(2)
        speak(tofer, "[face:tofer, -19, -13]* That's impossible, \n'cause![wait:5] I'm the COOLEST!")
        speak(tofer, "[face:tofer, -19, -13]* The COOLEST carrot in \nthe garden!")
        
        local soferPath = {{400, 240}, {480, 300}}
        local gracePath = {{400, 240}, {420, 320}}

        cutscene:setSprite(sofer, "cannot_move", 1/4)

        cutscene:walkPath(grace, gracePath, {["time"] = 1.5, ["loop"] = false, ["snap"] = false, ["relative"] = false, ["facing"] = "right", ["keep_facing"] = true})
        cutscene:panTo(360 + 250, Game.world.camera.y, 1)
        cutscene:wait(cutscene:slidePath(sofer, soferPath, {["time"] = 1, ["loop"] = false, ["snap"] = false, ["relative"] = false, ["after"] = function()
            cutscene:setSprite(sofer, "cannot")
        end}))
        
        speak(tofer, "[face:tofer, -19, -13]* Woah,[wait:5] brolio![wait:5] Is that my \nsweet [color:pink]LIL SIS[color:reset] I see?")
        music:stop()
        speak(sofer, "* Tofer.")
        music:play("tofer", 1)
        music:seek(2)
        speak(tofer, "[face:tofer, -19, -13]* It's been a long time![wait:5]\nNo see![wait:5] Let's talk!")
        speak(tofer, "[face:tofer, -19, -13]* How's the [color:pink]princess[color:reset]?[wait:5] The \n[color:#75FBED]piano[color:reset]?[wait:5] The [color:pink]princess \n[color:#75FBED]piano[color:reset]?") --Long ass dialogue
        music:stop()
        speak(sofer, "* I'm going to beat the $$!$ out of you.")
        cutscene:playSound("noise")
        tofer.sprite:pause()
        cutscene:wait(1)
        speak(tofer, "[face:emotioner, -19, -13]* What?")
    end;
}