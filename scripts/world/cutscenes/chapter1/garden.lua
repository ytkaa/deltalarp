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
                Game:setFlag("leading_colonels_squad", true)
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

    dirt1 = function(cutscene, event)
        local dirt = Game.world.player.children[2]
        local vess = cutscene:getCharacter("vess")
        local camera = Game.world.camera
        local initial_x = Game.world.camera.x
        local initial_y = Game.world.camera.y

        Game:addFlag("dirtflowertiles", 1)
        Game:setFlag("dirt_cutscene_active", true) -- Exiting climbing mode activates movement. So we have to set a flag to make Vess stuck in a collision box


        dirt:setParent(Game.world)
        dirt:setScale(2)
        dirt.layer = Game.world.player.layer + 1
        dirt:setPosition(Game.world.player.x - 20, Game.world.player.y - 75)
        cutscene:detachCamera()
        cutscene:wait(0.5)
        camera.target = dirt --Despite everything, the camera still instantly snaps to the dirt's position instead of cleanly panning there.
        Assets.playSound("sparkle_glock")
        Game.world.timer:everyInstant(1/2, function()
            local sparkle = GravitySparkle(dirt.x + math.random(1, 40), dirt.y + 40, 1.5, 0.3) --(x, y, scale, gravity)
            sparkle.layer = dirt.layer - 0.2
            Game.world:addChild(sparkle)
        end, 9)
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 20, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y + 10, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 10, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y + 10, 0.9))
        cutscene:wait(cutscene:slideTo(dirt, dirt.x, dirt.y - 10, 1.2))
        cutscene:wait(1)
        Assets.playSound("him_quick")
        cutscene:wait(cutscene:slideTo(dirt, "dirt1", 1, "out-cubic"))
        cutscene:wait(1)

        Assets.playSound("item")

        if Game:getFlag("dirtflowertiles") == 1 then
            Game:setFlag("dirtflowertile_1", true)
        elseif Game:getFlag("dirtflowertiles") == 2 then
            Game:setFlag("dirtflowertile_2", true)
        elseif Game:getFlag("dirtflowertiles") == 3 then
            Game:setFlag("dirtflowertile_3", true)
        end

        dirt.alpha = 0
        cutscene:wait(1)
        
        --Assets.playSound("noise")
        cutscene:wait(cutscene:panTo(initial_x, initial_y, 1, "out-cubic"))
        dirt:remove()
        cutscene:attachCamera()
        cutscene:wait(1)
        Game:setFlag("dirt_cutscene_active", false)
    end;
}