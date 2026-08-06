return {
    barracks2 = function(cutscene, event)
        local colonel = cutscene:getCharacter("colonel", 2)
        local colonel2 = cutscene:getCharacter("colonel", 1)
        local colonel3 = cutscene:getCharacter("colonel", 3)
        local colonel4 = cutscene:getCharacter("colonel", 4)
        local colonel5 = cutscene:getCharacter("colonel", 5)
        local vess = cutscene:getCharacter("vess")
        local options = {
            ["talk"] = true;
        }
        cutscene:setSpeaker(colonel, true)
        cutscene:setTextboxTop(false)
        cutscene:setSprite(colonel, "talk", 1/6)
        if event.interact_count == 1 then
            cutscene:text("* Greetings,[wait: 5] lieutenant !!", nil, colonel, options)
            cutscene:text("* FANTASTIC job evading the GARDNER !!", nil, colonel, options)
            cutscene:text("* Now we've pushed into the GARDEN !![wait:5] Operation Stalwart Kernel is complete...", nil, colonel, options)
            cutscene:text("* [color:lime]FRIENDSHIP[color:reset] can truly bring us to victory !!", nil, colonel, options)
            cutscene:text("* That being said,[wait:5] this was as far as HQ wanted us to push for now.", nil, colonel, options)
            cutscene:text("* That means we won't be going ahead with you,[wait:5] lieutenant.", nil, colonel, options)
            cutscene:text("* So,[wait:5] that means this is goodbye...", nil, colonel, options)
            cutscene:wait(1)
            cutscene:text("* UNLESS !!", nil, colonel, options)
            cutscene:text("* UNLESS !!", nil, colonel, options)
            cutscene:text("* You wanna go and PATROL the FIELD of WHEAT and CORN...", nil, colonel, options)
            cutscene:text("* In which case,[wait:5] let me know anytime.", nil, colonel, options)
            cutscene:text("* The squad and I will be happy to accompany you.", nil, colonel, options)
        elseif event.interact_count >= 2 then
            cutscene:text("* Well lieutenant?[wait:5] What'll it be?")
            local choice = cutscene:choicer({"Yes \npatrol", "No \npatrol"})
            if choice == 1 then
                cutscene:text("* Alright lieutenant !!!!!!!!!")
                cutscene:text("* Lead the way !!")
                colonel:convertToFollower()
                colonel2:convertToFollower()
                colonel3:convertToFollower()
                colonel4:convertToFollower()
                colonel5:convertToFollower()
                Game:addFollower(colonel)
                Game:addFollower(colonel2)
                Game:addFollower(colonel3)
                Game:addFollower(colonel4)
                Game:addFollower(colonel5)
                cutscene:interpolateFollowers()
                Game:setFlag("leading_colonels_squad", true)
            else 
                cutscene:text("* Alrighty lieutenant.[wait:5] We'll be here.")
            end
        end
        cutscene:setSprite(colonel, "idle") 
    end;
    barracks2_partydisband = function(cutscene, event)
        local colonel = cutscene:getCharacter("colonel", 2)
        local colonel2 = cutscene:getCharacter("colonel", 1)
        local colonel3 = cutscene:getCharacter("colonel", 3)
        local colonel4 = cutscene:getCharacter("colonel", 4)
        local colonel5 = cutscene:getCharacter("colonel", 5)
        local vess = cutscene:getCharacter("vess")
        local options = {
            ["talk"] = true;
        }
        if Game:getFlag("leading_colonels_squad", true) then
            local mainColonel = Game.world.followers[1]
            if #Game.party > 1 then
                mainColonel = Game.world.followers[2]
            end
            local vessPos = vess:getPosition() --Lmao
            local followers = Game.world.followers
            cutscene:setTextboxTop(true)
            cutscene:setSpeaker(mainColonel, true)
            cutscene:setSprite(mainColonel, "talk", 1/6)
            cutscene:text("* We can't go any further,[wait:5] lieutenant.")
            cutscene:text("* Good luck in the GARDEN...")
            cutscene:text("* ...and give GARDNER hell !!")
            -- some sort of cheer sound effect
            cutscene:wait(cutscene:fadeOut(1))
            Assets.playSound("item")
            cutscene:setSprite(mainColonel, "idle")
            --Game.world:removeFollower(colonel, 2)
            --Game.world:removeFollower(colonel2, 1)
            --Game.world:removeFollower(colonel3, 3)
            --Game.world:removeFollower(colonel4, 4)
            --Game.world:removeFollower(colonel5, 5) --i probably shouldnt have added the numbers here
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
            Game.world:loadMap("chapter1/farm_world/garden1")
            cutscene:wait(0.5)
            cutscene:look("vess", "up")
            cutscene:fadeIn(1)
        else
            return
        end
    end;
    ofer_intro = function(cutscene, event)
        local grace = cutscene:spawnNPC("grace", 860, 420)
        local vess = cutscene:getCharacter("vess")
        local door = Game.world:getEvent(6)
        local tofer = cutscene:spawnNPC("tofer", 1200, 280, {["solid"] = false})

        local sofer = cutscene:spawnNPC("sofer", 800, 160)
        --print(sofer:getColor()) --Of course, of course.
        sofer:setColor(0, 0, 0, 0)
        cutscene:setSprite(sofer, "chill")
        sofer.actor.high_pitch = true --We can just DO this. Crazy

        --local music = Music()
        cutscene:look(grace, "up")
        cutscene:detachCamera()
        cutscene:wait(cutscene:panTo(800, Game.world.camera.y, 2))
        cutscene:wait(cutscene:walkTo(vess, "vess_target", 3))
        cutscene:wait(2)
        cutscene:look(grace, "left")
        cutscene:wait(1)
        cutscene:setSpeaker(grace)
        cutscene:text("[face:brow, -19, -13]* Oh,[wait:5] hey.")
        cutscene:look(grace, "up")
        cutscene:wait(2)
        cutscene:look(grace, "left")
        cutscene:text("[face:consider, -19, -13]* Uhhh...[wait:5] why the $$$$ is \nthere a giant shed here.")
        cutscene:wait(1)
        cutscene:text("[face:sus, -19, -13]* Wait,[wait:5] no,[wait:5] I hate you.")
        cutscene:text("[face:pissed, -19, -13]* Stop pondering with me.")
        cutscene:look(grace, "up")
        cutscene:look(vess, "up")
        cutscene:wait(2)
        cutscene:look(grace, "left")
        cutscene:text("[face:consider, -19, -13]* But,[wait:5] like,[wait:5] I don't \nknow...")
        cutscene:look(vess, "right")
        cutscene:wait(1)
        cutscene:text("[face:brow, -19, -13][next]* It's kinda hard to keep \nhating ")
        Assets.playSound("locker")
        door:setColor(1, 1, 1, 0)
        cutscene:wait(0.2)
        cutscene:setSprite(grace, "fall")
        cutscene:shakeCharacter(grace)
        Assets.playSound("grace_surprise")
        cutscene:walkTo(vess, "vess_walkback", 0.2, "right", true)
        cutscene:wait(1.5)
        cutscene:resetSprite(grace)
        cutscene:look(vess, "up")
        cutscene:look(grace, "up")
        cutscene:wait(2)
        cutscene:wait(cutscene:panTo(800, 240, 2))
        cutscene:wait(1)
        cutscene:setSpeaker(tofer)
        cutscene:text("* Hey,[wait:5] hey,[wait:5] hey!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:nervous, -19, -13]* UHHHHH...")
        Game.world.music:stop()
        Game.world.music:play("tofer", 1)
        cutscene:wait(1.2) -- Intro of this song is 2 seconds on the dot. Thank god
        Assets.playSound("drive")
        cutscene:setAnimation(tofer, "cycle")
        cutscene:wait(cutscene:slideTo(tofer, "tofer_slide", 0.8))
        tofer:explode(0, 0, true)
        cutscene:wait(1)
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* [sound:tofer_checkit]Check it!")
        cutscene:wait(0.5)
        cutscene:look(grace, "left")
        cutscene:wait(1)
        cutscene:look(grace, "up")
        cutscene:wait(0.5)
        cutscene:setSpeaker(grace)
        cutscene:text("[face:wtf, -19, -13]* Who the $$$$ are you.")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] It's me,[wait:5] Tofer!")
        cutscene:text("[face:tofer, -19, -13]* Only the COOLEST CARROT \nin the garden.")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:neutral, -19, -13]* ...")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* Wanna know how cool \nI am ??!?")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:sus, -19, -13][next]* No????")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* ONE TIME,[wait:5] while I was \nskating!")
        cutscene:text("[face:tofer, -19, -13]* Someone fell and broke \ntheir ribs.")
        cutscene:text("[face:tofer, -19, -13]* Get it?")
        cutscene:wait(1)
        cutscene:setSpeaker(grace)
        cutscene:text("[face:brow, -19, -13]* ...")
        cutscene:text("[face:consider, -19, -13]* ...")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* I gave them snare ribs![wait:5] [sound:tofer_checkit][voice:none]\n:joy:")
        cutscene:wait(2)
        cutscene:setSpeaker(grace)
        cutscene:text("[next][face:brow, -19, -13]* Uhh,[wait:5] hey,[wait:5] look")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* AND.[wait:5] Check it,[sound:tofer_checkit][wait:5] there's \none more thing that \nmakes ME the coolest!")
        cutscene:text("[face:tofer, -19, -13]* I have a sweet [color:pink]LIL SIS[color:reset] \nwho plays piano!")
        cutscene:text("[face:tofer, -19, -13]* She even wears ribbons \nand dresses,[wait:5] plays with \nlil dolls...")
        cutscene:text("[face:tofer, -19, -13]* ...and loves [color:pink]\nPRINCESS-related media[color:reset]!")
        cutscene:text("[face:tofer, -19, -13]* Check it[sound:tofer_checkit],[wait:5] SOFER!")
        Game.world.music:stop()
        sofer:setColor(0, 0, 0, 1)
        cutscene:wait(1)
        Assets.playSound("item")
        tofer:setPosition(720, 280)
        cutscene:wait(1)
        cutscene:wait(cutscene:slideTo(sofer, "sofer_slide", 3))
        Assets.playSound("noise")
        cutscene:wait(3)
        Assets.playSound("cd_bagel/kris")
        sofer:setColor(1, 1, 1, 1)
        cutscene:setSprite(tofer, "tofer")
        cutscene:wait(2)
        Game.world.music:play("whoot3", 1)
        cutscene:setAnimation(tofer, "cycle")
        cutscene:setSpeaker(sofer)
        cutscene:setSprite(sofer, "move", 1/2)
        cutscene:text("* Hiiii~[wait:5] you two...[wait:5] I'm SOFER!")
        cutscene:text("* I'm Tofer's sweet little sister,[wait:5] and I love,[wait:5] love,[wait:5] LOVE[wait:5] playing the piano!")
        cutscene:text("* I love wearing ribbons![wait:5] I love wearing dresses![wait:5] I love playing with dolls!")
        cutscene:text("* And most of all,[wait:5] I love...[wait:5] I love...")
        cutscene:text("* I..[wait:5] love...[wait:5]")
        cutscene:setSprite(sofer, "chill")
        cutscene:text("* I...")
        Game.world.music:stop()
        cutscene:wait(2)
        cutscene:shakeCharacter(sofer)
        Assets.playSound("bump")
        cutscene:setSprite(sofer, "cannot")
        cutscene:wait(0.5)
        sofer.actor.high_pitch = false
        cutscene:text("* I CAN'T DO THIS ANYMORE.")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:setSprite(tofer, "tofer")
        cutscene:wait(1)
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:emotion, -19, -13]* What?")
        cutscene:setSpeaker(sofer)
        cutscene:text("[next]* I[wait:5] am so tired of")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* Check it![sound:tofer_checkit][wait:5] I just \ncouldn't hear 'cause I \nhad my 'pods in!")
        cutscene:setSpeaker(sofer)
        cutscene:text("* Okay.")
        cutscene:text("* Anyway.")
        cutscene:text("[next]* I[wait:5] am so tired of")
        Game.world.music:play("tofer", 1)
        Game.world.music:seek(2)
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:tofer, -19, -13][next]* Check it,[sound:tofer_checkit][wait:2] SOFER![wait:2] How \nabout some music?[wait:2] Sofer \non the piano,[wait:2] just like")
        Game.world.music:stop()
        cutscene:setSpeaker(sofer)
        cutscene:text("* Stop $$$$ing interrupting me.")
        cutscene:wait(1)
        cutscene:text("* Okay.")
        cutscene:text("* Anyway.")
        cutscene:text("* I[wait:5] am so tired of[wait:5] being your[wait:5] \"sweet lil sis\"[wait:5] who does cutesy stuff and piano all the time.")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:emotioner, -19, -13]* Check...[wait:5] it?")
        cutscene:setSpeaker(sofer)
        cutscene:text("* I don't want[wait:5] to watch princess shows.[wait:5] I don't want[wait:5] to play with dolls.")
        cutscene:text("* I DON'T EVEN LIKE PLAYING THE PIANO.")
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:emotionerer, -19, -13]* Check..???")
        cutscene:setSpeaker(sofer)
        cutscene:setSprite(sofer, "ticked")
        cutscene:text("* What I want...[wait:5] is to learn the GUITAR.")
        cutscene:setSprite(sofer, "want")
        cutscene:text("* I want to listen to ROCK MUSIC!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:consider, -19, -13]* (Rock music...)")
        cutscene:setSpeaker(sofer)
        cutscene:setSprite(sofer, "want", 1/2)
        cutscene:text("* I want to wear a beat-up leather jacket...[wait:5] to rent a motorcycle...")
        cutscene:setSprite(sofer, "want", 1/4)
        cutscene:text("* I...[wait:5] I want to PAINT...[wait:5] and DRAW!!!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:wtf, -19, -13]* (Painting...[wait:5] and \ndrawing ??!?)")
        Game.world.music:play("grace", 1)
        cutscene:setSprite(sofer, "want", 1/6)
        cutscene:wait(2)
        cutscene:text("[face:smug, -19, -13]* Hey.")
        cutscene:setSprite(sofer, "neutral")
        cutscene:setSpeaker(sofer)
        cutscene:text("* ?")
        cutscene:wait(cutscene:walkTo(grace, "grace_run", 0.35))
        cutscene:look(grace, "left")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:snark, -19, -13]* You don't have to like...[wait:5] \nprincesses and piano \nand $$!$.") -- Portaits and line breaks will kill me
        cutscene:text("[face:consider, -19, -13]* You can just,[wait:5] uhhh,[wait:5] \nchill with me.")
        cutscene:text("[face:kawaii, -19, -13]* And we can do painting \nand rock music and \nwhatever else you want !")
        cutscene:text("[face:kawaii_grin, -19, -13]* Because clearly what YOU \nwant is way cooler \nthan...")
        cutscene:text("[face:brow, -19, -13]* Tofer,[wait:5] and,[wait:5] uhhh...[wait:5] \nthat gray person.")
        cutscene:text("[face:playful, -19, -13]* Soooo...[wait:5] what do you \nsay?")
        Game.world.music:stop()
        cutscene:wait(1)
        cutscene:setSprite(sofer, "hm")
        cutscene:wait(1)
        cutscene:setSpeaker(sofer)
        cutscene:text("* I think...")
        cutscene:wait(1)
        cutscene:setSprite(sofer, "neutral")
        cutscene:text("* Um.[wait:10][react:* $$!$,0,50,nervous,grace]") --0, 50 is standard for bottom left corner react
        cutscene:setSprite(sofer, "hm")
        cutscene:text("* I...")
        cutscene:setSprite(sofer, "want", 1/8)
        Game.world.music:play("grace", 1)
        cutscene:text("* Let's do it !!!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:kawaii_cheesing, -19, -13]* Yeah !!![wait:5] Let's go !!!")
        Game.world.music:stop()
        Assets.playSound("drive")
        cutscene:setSprite(sofer, "want")
        cutscene:slideTo(grace, "final_slide", 0.8)
        cutscene:wait(cutscene:slideTo(sofer, "final_slide", 0.85))
        grace:remove()
        sofer:remove()
        cutscene:wait(2)
        cutscene:setSpeaker(tofer)
        cutscene:text("[face:emotioner, -19, -13]* I. [wait:10]Don't understand why \nSofer's being like this.")
        cutscene:text("[face:emotion, -19, -13]* But.")
        cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Well!")
        cutscene:setAnimation(tofer, "cycle")
        cutscene:wait(cutscene:slideTo(tofer, "tofer_final", 2.5))
        cutscene:look(vess, "right")
        cutscene:text("[face:tofer, -19, -13]* Guess it's just me and \nyou then![wait:5] Check it![sound:tofer_checkit]")
        cutscene:setSpeaker(nil)
        cutscene:setSprite(tofer, "tofer")
        cutscene:text("[voice:none][sound:intro1][noskip]* Tofer joined the party![wait:3s]")
        --cutscene:text("* ...[wait:5]or at least he would have if I had implemented that yet.[sound:awkward]") --Implemented.
        Game:addPartyMember("tofer")
        tofer:convertToFollower(1, false)
        cutscene:setAnimation(tofer, "cycle")
        cutscene:attachCamera()
        cutscene:alignFollowers()
        cutscene:attachFollowers()
        Game:setFlag("manor_seen", true)
    end;

    manor_entrance = function(cutscene, event)
        if Game:hasPartyMember("tofer") then
            local tofer = cutscene:getCharacter("tofer")
            cutscene:setSpeaker(tofer)
            cutscene:text("[face:tofer, -19, -13]* No can do,[wait:5] brolio![wait:5] I got \nthree dudes in there \ndoing renovations.")
            cutscene:text("[face:tofer, -19, -13]* Maybe tomorrow though.[wait:5] \nCheck it![sound:tofer_checkit]")
        else
            --print("Ya don't have him...") --Printing stutters the game (more than usual)
        end
    end;

    ladder1 = function(cutscene, event) --Recycled cornplate puzzle
        Game.world.music:pause()
        local fanfare = Assets.playSound("moss_fanfare")
        cutscene:wait(1.25)
        local spike1 = Game.world:getEvent(17)
        local spike2 = Game.world:getEvent(18)
        local spike3 = Game.world:getEvent(19)
        local options = {
            ["play_sound"] = false
        }
        fanfare:stop()
        spike1:explode(0, 0, false)
        spike2:explode(0, 0, false, options)
        spike3:explode(0, 0, false, options)
        Game:setFlag("garden_ladder1", true)

        Game.world.music:resume()
    end;

    ladder2 = function(cutscene, event) --Recycled cornplate puzzle
        Game.world.music:pause()
        local fanfare = Assets.playSound("moss_fanfare")
        cutscene:wait(1.25)
        local spike1 = Game.world:getEvent(17)
        local spike2 = Game.world:getEvent(18)
        local spike3 = Game.world:getEvent(19)
        local spike4 = Game.world:getEvent(99)
        local options = {
            ["play_sound"] = false
        }
        fanfare:stop()
        spike1:explode(0, 0, false)
        spike2:explode(0, 0, false, options)
        spike3:explode(0, 0, false, options)
        spike4:explode(0, 0, false, options)
        Game:setFlag("garden_ladder2", true)

        Game.world.music:resume()
    end;

    dirt_climb = function(cutscene, event)
        local dirt = Game.world.player.children[2]
        local vess = cutscene:getCharacter("vess")
        local camera = Game.world.camera

        Game:addFlag("dirtflowertiles", 1)
        Game:setFlag("dirt_cutscene_active", true) -- Exiting climbing mode activates movement. So we have to set a flag to make Vess stuck in a collision box


        dirt:setParent(Game.world)
        dirt:setScale(2)
        dirt.layer = Game.world.player.layer + 1
        dirt:setPosition(Game.world.player.x - 20, Game.world.player.y - 75)
        cutscene:detachCamera()
        cutscene:wait(0.5)
        camera.target = dirt --Despite everything, the camera still instantly snaps to the dirt's position instead of cleanly panning there.
        cutscene:gotoCutscene("chapter1/garden.dirt1", dirt, 1)
    end;

    dirt_ground = function(cutscene, event)
        local dirt = Game.world.player.children[2]
        local vess = cutscene:getCharacter("vess")
        local camera = Game.world.camera

        Game:addFlag("dirtflowertiles", 1)
        Game:setFlag("dirt_cutscene_active", true) -- This is superfluous since we're not exiting climbing mode. But hey


        dirt:setParent(Game.world)
        dirt:setScale(2)
        dirt.layer = Game.world.player.layer + 1
        dirt:setPosition(Game.world.player.x - 20, Game.world.player.y - 75)
        --cutscene:detachCamera() --The camera mustn't be detached, since we aren't exiting from climbing mode.
        cutscene:wait(0.5)
        camera.keep_in_bounds = false
        camera.target = dirt --Despite everything, the camera still instantly snaps to the dirt's position instead of cleanly panning there.
        cutscene:gotoCutscene("chapter1/garden.dirt1", dirt, 1.5)
    end;

    dirt1 = function(cutscene, dirt, panSpeed)
        --local dirt = Game.world.player.children[2]
        local vess = cutscene:getCharacter("vess")
        local camera = Game.world.camera
        local tofer = cutscene:getCharacter("tofer")
        local shovel = cutscene:getCharacter("shovel")
        --local initial_x = Game.world.camera.x
        --local initial_y = Game.world.camera.y

        Assets.playSound("sparkle_glock")
        Game.world.timer:everyInstant(1/2, function()
            local sparkle = GravitySparkle(dirt.x + math.random(1, 40), dirt.y + 40, 1.5, 0.3) --(x, y, scale, gravity)
            sparkle.layer = dirt.layer - 0.2
            Game.world:addChild(sparkle)
        end, 9)
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 20, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y + 10, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 10, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y + 10, 1.4))
        --cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 10, 1.2))
        cutscene:wait(0.4)
        Assets.playSound("him_quick")
        cutscene:wait(cutscene:slideTo(dirt, "dirt_slide", panSpeed, "out-cubic"))
        camera.keep_in_bounds = true
        cutscene:wait(1)

        Assets.playSound("item")

        if Game:getFlag("dirtflowertiles") == 1 then
            Game:setFlag("dirtflowertile_1", true)
        elseif Game:getFlag("dirtflowertiles") == 2 then
            Game:setFlag("dirtflowertile_2", true)
        elseif Game:getFlag("dirtflowertiles") == 3 then
            Game:setFlag("dirtflowertile_3", true)
        elseif Game:getFlag("dirtflowertiles") == 4 then
            Game:setFlag("dirtflowertile_4", true)

            dirt.alpha = 0
            cutscene:wait(1)

            cutscene:setSpeaker(shovel)
            cutscene:wait(cutscene:panTo(shovel.x, shovel.y, 1, "out-cubic"))
            cutscene:text("* Oh,[wait:5] thank goodness!")
            Assets.playSound("jump")
            cutscene:wait(cutscene:jumpTo(shovel, 1460, 900, 20, 1, "jump", "talk"))
            local shovelPath = {
                {1460, 1100},
                {1940, 1100},
                {1940, 940},
                {2220, 940},
            }
            cutscene:slidePath(shovel, shovelPath, {["time"] = 3, ["loop"] = false, ["snap"] = false, ["relative"] = false})
        end


        dirt.alpha = 0
        cutscene:wait(1)
        
        --Assets.playSound("noise")
        cutscene:wait(cutscene:panTo(vess.x, vess.y, panSpeed, "out-cubic"))
        dirt:remove()
        cutscene:attachCamera()
        cutscene:wait(1)

        Game:setFlag("dirt_cutscene_active", false)

        for _,member in pairs(Game.party) do
            member:heal(999, false) --We have to heal here, otherwise the quicksave will screw you over if you had low health.
        end

        if Game:getFlag("dirtflowertiles") ~= 4 then
            print("QUICKSAVED. AND... HEALED.")
            Game:saveQuick()
            cutscene:look(vess, "down")
        else
            cutscene:setSpeaker(tofer)
            cutscene:text("[face:tofer, -19, -13]* Check it![sound:tofer_checkit][wait:5] I just \nsaved Shovelio,[wait:5] [color:red]LIL BUD[color:reset]!")
            --vess:faceTowards(tofer)
            cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Let's go talk to \n'em. [wait:5][voice:none][sound:tofer_checkit]:joy:")
            cutscene:wait(cutscene:fadeOut(1, {["music"] = 2}))
            Assets.playSound("escaped")

            cutscene:detachFollowers()
            cutscene:detachCamera()
            vess:setPosition(2080, 910)
            tofer:setPosition(2120, 960)
            cutscene:look(vess, "right")
            camera:setPosition(2160, 900) 

            cutscene:disableMovement()

            cutscene:wait(1)
            cutscene:wait(cutscene:fadeIn(1))

            cutscene:setSpeaker(shovel)
            cutscene:text("* Oh,[wait:5] how will I ever repay you for rescuing me from the [color:pink]depths[color:reset] of that tall pillar ??!?")
            cutscene:setSpeaker(tofer)
            cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] It's nothing.[wait:5] I resuscitate on the \nregular!")
            cutscene:setSpeaker(shovel)
            cutscene:text("* Oh my LORD.")
            cutscene:text("* LOOK,[wait:5] gray person![wait:5] YOUR actions have inspired me!")
            cutscene:text("* I have come to realize that I am NOT a mere lowly shovel...")
            cutscene:text("* ...[wait:5]I am a shovel of [color:yellow]HIGH REGARD[color:reset]!")
            cutscene:text("* And thus,[wait:5] my shovelitudes have proven...[wait:5] more talentful than I had ever envisioned!")
            cutscene:text("* WATCH,[wait:5] as I realize my talent and put it to GOOD USE!")
            cutscene:text("* By glamorously moving this pile of dirt!")

            cutscene:setSprite(tofer, "tofer")
            Assets.playSound("noise")

            cutscene:wait(2)
            cutscene:shakeCharacter(shovel)
            cutscene:setSprite(shovel, "jump")
            Assets.playSound("wing")
            cutscene:wait(0.5)
            cutscene:setSpeaker(shovel)
            cutscene:text("* Zah!", {["talk"] = false})
            local dirtPile = Game.world:getEvent(163)
            dirtPile:explode(math.random(-150, 25), math.random(-100, 50), true)
            cutscene:wait(0.35)
            dirtPile:explode(math.random(-150, 25), math.random(-100, 50), true)
            cutscene:wait(0.35)
            dirtPile:explode(math.random(-150, 25), math.random(-100, 50), true)
            cutscene:wait(0.35)
            dirtPile:explode(math.random(-150, 25), math.random(-100, 50), true)
            cutscene:wait(1.5)
            dirtPile:explode(-75, 0, false)

            cutscene:wait(2)

            cutscene:setAnimation(tofer, "cycle")
            cutscene:setSpeaker(tofer)
            local music = Music()
            music:play("tofer")
            music:seek(2)
            cutscene:text("[face:tofer, -19, -13]* Heh![wait:5] That's classic \nShovelio for you![wait:5] Nice \nmoves,[wait:5] brotato.")
            cutscene:text("[face:tofer, -19, -13]* I didn't know I was \nso inspiring to the \npeople!")
            cutscene:wait(2)

            music:stop()
            cutscene:setSpeaker(shovel)
            cutscene:text("* Tofer.")
            cutscene:setSprite(tofer, "tofer")
            Assets.playSound("noise")
            cutscene:wait(1)
            cutscene:text("* You are the most OBNOXIOUS person I have ever met.")
            cutscene:setSpeaker(tofer)
            cutscene:text("[face:tofer, -19, -13]* Heh!")
            cutscene:text("[face:emotioner, -19, -13]* Wait,[wait:5] what?")
            cutscene:setSpeaker(shovel)
            cutscene:setSprite(shovel, "talk")
            cutscene:text("* I must inquire...")
            cutscene:text("* ...how the HELL are YOU planning to lead rebellion against the GARDNER ??!?")
            cutscene:text("* If all you do is IRRITATE and TAKE UNDUE CREDIT ??!?")
            cutscene:setSpeaker(tofer)
            cutscene:text("[face:emotionerer, -19, -13]* I,[wait:5] well...")
            cutscene:setSpeaker(shovel)
            cutscene:text("* Gray person,[wait:5] I trust your intent and resolve...")
            cutscene:text("* But PLEASE reconsider![wait:5] Allying with this individual!")
            cutscene:text("* If you do not,[wait:5] I'm afraid he may lead you down a treacherous path...[wait:5] with a tumultuous end!")
            cutscene:wait(2)
            cutscene:text("* Welph,[wait:5] that is all.[wait:5] Goodbye to my gray knight...[wait:5] and the knave!")
            --Assets.playSound("drive")
            --cutscene:wait(cutscene:slideTo(shovel, shovel.x + 500, shovel.y, 1))
            local shovelPath = {
                {2420, 940},
                {2420, 1480}
            }
            cutscene:wait(cutscene:slidePath(shovel, shovelPath, {["time"] = 2, ["loop"] = false, ["snap"] = false, ["relative"] = false}))
            shovel:remove()
            Game:setFlag("shovel_quest_done", true)
            Game.party[1]:setFlag("title", "Gray Knight\nShovelrous.")
            cutscene:wait(1)

            cutscene:setSpeaker(tofer)
            cutscene:text("[face:emotion, -19, -13]* So.")
            cutscene:wait(1)
            cutscene:text("[face:tofer, -19, -13]* Heh!")
            cutscene:setAnimation(tofer, "cycle")
            cutscene:wait(cutscene:slideTo(tofer, "toferslide", 1))
            cutscene:text("[face:emotioner, -19, -13]* Maybe I should've \nsaid this earlier...")
            cutscene:text("[face:emotionerer, -19, -13]* But it's true.")
            cutscene:text("[face:tofer, -19, -13]* I've been planning to \nBring the Fight![sound:tofer_checkit][wait:5] To \nthe evil GARDNER...")
            cutscene:text("[face:emotioner, -19, -13]* But.[wait:5] I don't know \nwhat it is...")
            cutscene:text("[face:emotionerer, -19, -13]* The people just aren't\ninterested!")
            cutscene:wait(1)
            cutscene:text("[face:tofer, -19, -13]* I mean,[wait:5] there's no way![wait:5] \nThat it's a \"me\" \nproblem!")
            cutscene:text("[face:emotionerer, -19, -13]* Right?")
            cutscene:text("[face:emotionerer, -19, -13]* Right,[wait:5] gray brolio?")
            local choice = cutscene:choicer({"You're good", "Dude"})
            
            if choice == 1 then
                music:play("tofer")
                music:seek(2)
                cutscene:text("[face:tofer, -19, -13]* Heh,[wait:5] right![wait:5] Check it![sound:tofer_checkit]")
            else
                cutscene:setSprite(tofer, "tofer")
                cutscene:wait(1)
                cutscene:text("[face:emotionerer, -19, -13]* ...")
                cutscene:wait(1)
                music:play("tofer")
                music:seek(2)
                cutscene:setAnimation(tofer, "cycle")
                cutscene:text("[face:tofer, -19, -13]* Heh,[wait:5] what a way with \nwords![wait:5] That's dude to \nyou too,[wait:5] gray brolio!")
            end

            cutscene:attachCamera()
            cutscene:alignFollowers()
            cutscene:attachFollowers()

            music:stop()
            Game.world.music:play("garden", 0)
            Game.world.music:fade(1, 2)
        end
    end;

    garden_warfare = function(cutscene, event)
        -- All this for one joke
        if event.interact_count == 1 then
            cutscene:text("* Spikes.")
            if Game.world.map.name == "Garden - Ladder 1" and Game:getFlag("one_too", false) == false then
                Game:setFlag("two_too", true)
            elseif Game.world.map.name == "Garden - Ladder 2" and Game:getFlag("two_too", false) == false then
                Game:setFlag("one_too", true)
            end
        else
            if Game:getFlag("two_too") and Game.world.map.name == "Garden - Ladder 2" then
                cutscene:text("* It's garden warfare,[wait:5] too.")
            elseif Game:getFlag("one_too") and Game.world.map.name == "Garden - Ladder 1" then
                cutscene:text("* It's garden warfare,[wait:5] too.")
            else
                cutscene:text("* It's garden warfare...")
            end
        end
    end;

    shovel_plea = function(cutscene, event)
        local shovel = cutscene:getCharacter("shovel")
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")
        local camera = Game.world.camera
        local music = Music()

        local x, y = shovel:getScreenPos()

        local speaker = function(speaker)
            cutscene:setSpeaker(speaker)
        end

        local snap = function(who)
            speaker(who)
            camera.target = who
            Assets.playSound("noise")
        end
        
        Game.world.music:pause()

        speaker(shovel)
        cutscene:text("* HELP ??!?")
        cutscene:wait(cutscene:alert(vess, 1))
        vess:faceTowards(shovel)

        if x > 600 or x < 40 or y > 440 or y < 40 then
            cutscene:detachCamera()
            cutscene:wait(cutscene:panTo(shovel.x, shovel.y, 1.5, "out-cubic"))
            cutscene:setTextboxTop(false)
        end
        cutscene:wait(0.5)
        cutscene:text("* Hi,[wait:5] so,[wait:5] I don't know what happened.")
        cutscene:text("* But,[wait:5] as a mere lowly shovel,[wait:5] I have managed to get stuck atop this pillar...")
        cutscene:text("* ...[wait:5]surrounded by hostile and ravenous flora!")
        cutscene:text("* I hadn't the faintest clue I was this talented!")
        cutscene:text("* Alas,[wait:5] this is the greatest extent of my talent.")
        cutscene:text("* I won't even ATTEMPT to build a bridge of [color:purple]glamorous flowers[color:reset] to escape this prison of altitude!")
        cutscene:text("* If only someone dashing and talented themself could RESCUE me from this peril!")
        cutscene:text("* Someone like YOU!")
        snap(tofer)
        cutscene:attachCameraImmediate()
        music:play("tofer")
        music:seek(2)
        cutscene:text("[face:tofer, -19, -13]* Check it![sound:tofer_checkit][wait:5] That's gotta \nbe me![wait:5] Dashing,[wait:5] and \nravenous!")
        music:pause()
        snap(shovel)
        cutscene:text("* Like YOU,[wait:5] in the gray!")
        snap(tofer)
        music:resume()
        cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] That's me.[wait:5] \nI got a gray jacket \nback at the manor!")
        snap(shovel)
        music:pause()
        if Game:getFlag("talked_to_shovel", false) then
            cutscene:text("[speed:1.25]* YOU !!![wait:5] IN THE PURPLE AND WHITE THING !!!")
            cutscene:text("[speed:1.25][next]* THE ONE WHO TALKED TO ME EARLIER !!![wait:5] PLEASE ??!?")
        else
            cutscene:text("[speed:1.25][next]* YOU !!![wait:5] IN THE PURPLE AND WHITE THING !!! PLEASE ??!?")
        end
        snap(tofer)
        music:resume()
        cutscene:text("[face:tofer, -19, -13]* Heh.[wait:5] Don't worry.[wait:5] \nI'll save you,[wait:5] Shovelio![wait:5] \n[voice:none][sound:tofer_checkit]:joy:")
        snap(shovel)
        music:pause()
        cutscene:text("[next]* I don't WAN")
        snap(tofer)
        music:resume()
        cutscene:text("[face:tofer, -19, -13]* Me and my [wait:5][color:red]LIL BUD[color:reset][wait:5] are \nhere to HELP!")
        speaker(nil)
        music:stop()
        cutscene:text("[noskip]* ([sound:cd_bagel/noelle][color:yellow]NEW QUEST[color:reset]:[wait:20] Save [color:blue]SHOVEL[color:reset]!)[wait:1s]", nil, nil)
        speaker(tofer)
        cutscene:text("[face:tofer, -19, -13]* I gotchu![sound:tofer_checkit]")

        camera.target = nil
        Assets.playSound("noise")
        Game.world.music:resume()

        Game:setFlag("shovel_plea_active", false)
        Game:setFlag("shovel_quest", 1)

        for _,member in pairs(Game.party) do
            member:heal(999, false) --We have to heal here, otherwise the quicksave will screw you over if you had low health.
        end

        print("QUICKSAVED. AND... HEALED.")
        Game:saveQuick()
    end;

    grace_sofer1 = function(cutscene, event)
        local grace = cutscene:spawnNPC("grace", 2430, 2440, {["facing"] = "right"})
        local sofer = cutscene:spawnNPC("sofer", 2500, 2440)
        local tofer = cutscene:getCharacter("tofer")
        local vess = cutscene:getCharacter("vess")

        local music = Music()

        local speak = function(speaker, text)
            cutscene:setSpeaker(speaker)
            cutscene:text(text)
        end

        speak(tofer, "[face:tofer, -19, -13] * Woah,[wait:5] brolio![wait:5] Check it![sound:tofer_checkit]")
        cutscene:look(vess, "right")
        cutscene:wait(0.5)

        cutscene:detachCamera()
        Game.world.music:fade(0, 1, function() Game.world.music:pause() end)
        cutscene:wait(cutscene:panTo("sofer_scene", 2, "out-cubic"))

        music:play("whoot3", 1)
        speak(sofer, "* GRACE.")
        speak(grace, "[face:snark, -19, -13]* Hey.")
        speak(sofer, "* Have you ever motorcycled?")
        cutscene:setSprite(sofer, "talk", 1/4)
        speak(sofer, "* Do you know where we could get one?")
        speak(grace, "[face:neutral, -19, -13]* ...")
        speak(grace, "[face:frown, -19, -13]* ...[wait:5]no.")
        cutscene:setSprite(sofer, "sad")
        speak(sofer, "* Aw.")
        speak(grace, "[face:brow, -19, -13]* I mean,[wait:5] really...")
        cutscene:setSprite(sofer, "neutral")
        cutscene:wait(0.5)
        cutscene:look(grace, "left")
        cutscene:wait(0.5)
        cutscene:look(grace, "up")
        cutscene:wait(0.5)
        cutscene:look(grace, "down")
        cutscene:wait(0.5)
        cutscene:look(grace, "right")
        cutscene:wait(1)
        music:stop()
        speak(grace, "[face:kawaii_brow, -19, -13]* I don't know WHAT \nthe $$$$ is going on \nin this place.")
        cutscene:setSprite(sofer, "hm")
        speak(sofer, "* What do you mean?")
        speak(grace, "[face:brow, -19, -13]* I mean,[wait:5] like...")
        speak(grace, "[face:sus, -19, -13]* I just came to this \nbarn.[wait:5] For food,[wait:5] like \nalways...")
        speak(grace, "[face:brow, -19, -13]* And today,[wait:5] I guess \nthere's just another \n$$$$ing world in here.")
        speak(sofer, "* Huh.")
        speak(grace, "[face:pissed, -19, -13]* And,[wait:5] like...")
        speak(grace, "[face:angry_mark, -19, -13]* It feels like NOTHING\nI eat here $$$$ing\nmatters!")
        cutscene:setSprite(sofer, "sad")
        speak(sofer, "* Damn.")
        music:play("whoot3", 1)
        speak(grace, "[face:kawaii_grin, -19, -13]* Outside of that,[wait:5] I've\nhad fun today !!!")
        cutscene:setSprite(sofer, "chill")
        speak(grace, "[face:kawaii_grin, -19, -13]* And you're,[wait:5] uh,[wait:5] cool !!!")
        cutscene:setSprite(sofer, "talk", 1/6)
        speak(sofer, "* Yeah !!![wait:5] You're cool too !!!")
        cutscene:wait(2)
        
        speak(sofer, "* I want to complain,[wait:5] too!")
        speak(grace, "[face:consider, -19, -13]* Okay...[wait:5] about what?")
        cutscene:setSprite(sofer, "cannot")
        music:stop()
        speak(sofer, "* My [color:red]BROTHER[color:reset].")
        cutscene:setSprite(sofer, "ticked")
        speak(sofer, "* He REALLY gets on my nerves!")
        speak(grace, "[face:munch, -19, -13]* Hah,[wait:5] yeah,[wait:5] I could see \nwhy earlier.")
        speak(sofer, "* I'm tired of him painting me as something I'm not!")
        speak(sofer, "* All of the princess piano $$!$.[wait:5] That's not ME![wait:5] I hate princess piano $$!$.")
        speak(sofer, "* WE have to deal with him somehow.")
        speak(grace, "[face:snark, -19, -13]* Hah,[wait:5] yeah.[wait:5] We should,[wait:5]\nlike,[wait:5] stage an \nintervention!")
        speak(grace, "[next][face:brow, -19, -13]* Or something.[wait:5] Just get \nhim to stop doing this \n$$--")
        cutscene:setSprite(sofer, "want", 1/4)
        music:play("grace", 1)
        speak(sofer, "* Let's beat the $$!$ out of him.")
        cutscene:walkTo(grace, grace.x - 20, grace.y, 0.2, "right", true)
        cutscene:wait(1)
        speak(grace, "[face:nervous, -19, -13]* Uhhhh,[wait:5] maybe that's not.[wait:5]\nNecessary.")
        speak(grace, "[face:sus, -19, -13]* Like,[wait:5] that gray person\nis probably with him,[wait:5]\nand I wouldn't want to...")
        speak(grace, "[face:consider, -19, -13]* Uhh,[wait:5] like,[wait:5] maybe we\ntry talking Tofer out of\nbeing...")
        speak(grace, "[face:brow, -19, -13]* ...[wait:5]uhh,[wait:5] like this.")

        music:stop()
        cutscene:setSprite(sofer, "neutral")
        cutscene:wait(2)
        cutscene:setSprite(sofer, "hm")
        speak(sofer, "* Um.")
        cutscene:wait(2)
        cutscene:setSprite(sofer, "chill")
        music:play("whoot3", 1)
        speak(sofer, "* Okay fine.")
        cutscene:setSprite(sofer, "ticked")
        speak(sofer, "* But we need to go PAINTING first !!!")
        speak(grace, "[face:angry_mark, -19, -13]* Oh my GOD.")
        speak(grace, "[face:kawaii, -19, -13]* You're so right.[wait:5] \nLet's go !!!")

        music:stop()
        cutscene:setSprite(sofer, "want", 1/8)
        cutscene:playSound("drive") --Literally just now discovered cutscene:playSound
        cutscene:slideTo(grace, grace.x + 500, grace.y, 0.8)
        cutscene:wait(cutscene:slideTo(sofer, sofer.x + 500, sofer.y, 0.8))

        cutscene:wait(1)
        
        cutscene:setSprite(tofer, "tofer")
        cutscene:wait(cutscene:panTo(vess.x, vess.y, 2, "out-cubic"))
        grace:remove()
        sofer:remove()

        speak(tofer, "[face:emotionerer, -19, -13]* Woah,[wait:5] brolio...")
        speak(tofer, "[face:emotioner, -19, -13]* Did you catch any\nof that?")
        cutscene:resetSprite(tofer)
        speak(tofer, "[face:tofer, -19, -13]* 'Cause I had my pods in.[wait:5]\nCheck it![sound:tofer_checkit]")
        speak(nil, "* (You stifle a disapproving glare.)")

        Game.world.music:resume()
        Game.world.music:fade(1, 1)

        cutscene:attachCamera()
        cutscene:look(vess, "down")
    end;

    ladders_shortcut = function(cutscene, event) --Recycled cornplate puzzle
        cutscene:enableMovement()
    
        local spike1 = Game.world:getEvent(400)
        local spike2 = Game.world:getEvent(401)
        local spike3 = Game.world:getEvent(402)
        local tile = Game.world:getEvent(411)
        local block = Game.world:getEvent(412)
        local options = {
            ["play_sound"] = false
        }
        spike1:explode(0, 0, false)
        spike2:explode(0, 0, false, options)
        spike3:explode(0, 0, false, options)
        Game:setFlag("ladders_shortcut", true)

        cutscene:wait(1)
        tile:explode(0, 0, false)
        cutscene:wait(0.5)
        block:explode(0, 0, false)
        Game:setFlag("ladders_shortcut_puzzle", true)
    end;

    forgetting = function(cutscene)
        cutscene:text("* (Aren't you forgetting something important?)")
    end;
}