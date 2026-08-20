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
        music:play("individual_wip")
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
        music:play("individual_wip")
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
                        music:play("individual_wip")
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
                        music:play("individual_wip")
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
}