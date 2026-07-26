return {
    grace_intro = function(cutscene, event)
        cutscene:detachCamera()
        cutscene:setTextboxTop(false)
        local grace = cutscene:spawnNPC("grace", 320, 200)
        local vess = cutscene:getCharacter("vess")
        cutscene:setSpeaker(grace)
        cutscene:look(grace, "up")
        cutscene:look(vess, "up")
        cutscene:wait(1)
        cutscene:wait(cutscene:panTo("grace_intro"))
        cutscene:wait(2)
        cutscene:look(grace, "down")
        cutscene:wait(1)
        cutscene:alert(vess, 1)
        local options = {
            ["top"] = false
        }
        local auto = {
            ["auto"] = true
        }
        cutscene:wait(cutscene:alert(grace, 1))
        local music = Music()
        
        cutscene:text("[face:omg, -19, -13]* Oh my GOD.") --Setting portait offset in the actor file doesn't work specifically for Grace for some fucking reason. Oh my GOD.
        -- Making and choosing faces is fun asl tho
        cutscene:panTo(320, 420)
        cutscene:wait(cutscene:walkTo(grace, 320, 340, 2))
        cutscene:wait(cutscene:text("[face:sus, -19, -13]* So YOU were the one \ntaking food from \nthe barn.", options))

        cutscene:wait(cutscene:text("[face:sad_brow, -19, -13]* Guess that's why there's \nbeen less food for[wait:5] \nme[wait:3] recently...", options))
        cutscene:wait(cutscene:text("[face:smug, -19, -13]* Hah.[wait:5] Okay.[wait:5] That's cool.[wait:5]", options))
        
        cutscene:panTo(320, 500)
        cutscene:wait(cutscene:walkTo(grace, 320, 420, 2.5))
        cutscene:wait(cutscene:text("[face:pissed, -19, -13]* You creepy #$$@#."))
        music:play("grace")
        cutscene:setSprite(grace, "down_angry")
        cutscene:wait(2)
        cutscene:wait(cutscene:text("[face:angry, -19, -13]* This is why nobody \nlikes you."))
        cutscene:wait(cutscene:text("[face:angry_mark, -19, -13]* Of COURSE it would be \nYOUR fault I've had \nto...[wait:5] to...", options))
        music:stop()
        --Assets.playSound("grace_surprise_wip")
        cutscene:wait(2)
        cutscene:resetSprite(grace)
        cutscene:wait(cutscene:text("[face:nervous, -19, -13]* Huh?[wait:5] Why am I dressed \nlike this?", options))
        cutscene:wait(cutscene:text("[face:nervous, -19, -13]* Why is the inside of \nthis barn so dark?", options))
        cutscene:wait(cutscene:text("[face:kawaii, -19, -13]* Hah,[wait:5] I don't know either", auto))
        music:play("grace")
        cutscene:setSprite(grace, "down_angry")
        cutscene:wait(cutscene:text("[face:angry_mark, -19, -13]* Wait,[wait:5] no,[wait:5] I don't like \nyou,[wait:5] we're NOT talking."))
        cutscene:wait(cutscene:text("[face:pissed, -19, -13]* Just...[wait:5] go away."))
        cutscene:wait(cutscene:text("[face:pissed, -19, -13]* I don't need you \nstealing more of my \nfood..."))
        cutscene:text("[face:angry, -19, -13]* ...food that I found \nfair and $$$$ing square.")
        cutscene:wait(cutscene:text("[face:neutral, -19, -13]* $$!$ is hard enough to \ncome by already."))
        music:stop()
        cutscene:resetSprite(grace)
        cutscene:walkTo(grace, "grace_leaf", 3)
        cutscene:wait(1)
        cutscene:wait(cutscene:attachCamera())
        grace:remove()
        print("She gone")
    end;

    cornplate_puzzle = function(cutscene, event)
        Game.world.music:pause()
        Assets.playSound("moss_fanfare")
        cutscene:wait(4)
        local spike1 = Game.world:getEvent(18)
        local spike2 = Game.world:getEvent(19)
        local spike3 = Game.world:getEvent(20)
        local options = {
            ["play_sound"] = false
        }
        spike1:explode(0, 0, false)
        spike2:explode(0, 0, false, options)
        spike3:explode(0, 0, false, options)
        Game:setFlag("cornplate_puzzle", true)
        Game.world.music:resume()
    end;

    jimmy_rustling = function(cutscene, event)
        if Game:getFlag("jimmy_rustled", false) == true then
            cutscene:wait(cutscene:text("* (...)"))
            Game.world:stopCutscene()
        end
        if event.interact_count == 1 then
            cutscene:wait(cutscene:text("* Y'know,[wait:5] it's illegal around heres to rustle Jimmy's (!)"))
        elseif event.interact_count == 2 then
            cutscene:wait(cutscene:text("* STOP RUSTLING JIMMY'S (!!!)"))
        elseif event.interact_count == 3 then
            cutscene:wait(cutscene:text("* Why are you still rustling Jimmy."))
        elseif event.interact_count == 4 then
            Game:setFlag("jimmy_rustled", true)
            cutscene:wait(cutscene:text("* (You felt a shift in the quantum fluctuations of the wheat field.)"))
            cutscene:wait(cutscene:text("* (Things feel...[wait:5] a little [sound:ominous]emptier now.)"))
        end
    end;

    grace_couch = function(cutscene)
        cutscene:enableMovement();
        local grace = cutscene:spawnNPC("grace", 540, 300)
        cutscene:wait(cutscene:walkTo(grace, "grace_leaf", 0.7))
        grace:remove()
    end;

    barracks = function(cutscene, event)
        local colonel = cutscene:getCharacter("colonel", 2)
        local vess = cutscene:getCharacter("vess")
        local options = {
            ["talk"] = true;
        }
        cutscene:setSpeaker(colonel, true)
        cutscene:setTextboxTop(false)
        Game.world.music:pause()
        cutscene:wait(cutscene:alert(colonel, 1))
        cutscene:setSprite(colonel, "talk", 1/6)
        cutscene:text("* WAIT !!", nil, colonel, options) --It should not be this difficult to get npcs in a cutscene to use talk sprites
        cutscene:text("* WAIT !!", nil, colonel, options)
        cutscene:text("* [speed:0.05]...", nil, colonel, options)
        cutscene:text("[speed:0.60]* ...you're with the Gardner,[wait:5] aren't you.[wait:5] Lieutenant.[wait:5]", nil, colonel, options)
        cutscene:look(vess, "left")
        cutscene:wait(2)
        cutscene:text("* Well ??[wait:5] Are you ??![wait:5] \nARE YOU ??!?[wait:5]")
        local choice = cutscene:choicer({"Yes with \nGardner", "No with Gardner.\nWho Gardner"})
        if choice == 1 then
            cutscene:text("* [speed:0.05]...")
            cutscene:text("[speed:0.60]* Lieutenant...")
            cutscene:text("* No you're not !!!!!!!!!")
            cutscene:text("* You seem a little too...[wait:5] animated,[wait:5] for his tastes...")
            cutscene:text("* And regardless,[wait:5] that old Gardner likes to work alone !!")
        else 
            cutscene:text("* Heh.[wait:5] I knew that,[wait:5] lieutenant!")
            cutscene:text("* You just seem a little too...[wait:5] animated,[wait:5] for his tastes.")
            cutscene:text("* As for who he is...[wait:5]")
            cutscene:text("* Let's just say...[wait:5] he likes to work alone.")
        end
        cutscene:text("* He works alone to \"harvest the crops.\"[wait:5] That's how he puts it.")
        cutscene:text("* Now,[wait:5] about harvesting those crops...")
        cutscene:wait(1)
        cutscene:shakeCharacter(colonel)
        Assets.playSound("bump")
        cutscene:wait(0.5)
        cutscene:text("* THAT'S US !!![wait:5] HE'S BEEN HARVESTING US COLONELS AND STEALING OUR LIFE FORCE !!!")
        cutscene:wait(1)
        cutscene:text("* Lieutenant,[wait:5] when you meet that Gardner,[wait:5] don't run away !!")
        cutscene:text("* Stand your ground,[wait:5] and...[wait:5] and give him hell,[wait:5] you hear me !!")
        Game.world.music:resume()
        if (Game:getFlag("jimmy_rustled", false)) == true then
            cutscene:wait(1)
            Game.world.music:pause()
            cutscene:text("* WAIT !!")
            cutscene:text("* Lieutenant...[wait:5] I sense a disturbance in the nearby quantum fluctuations...")
            cutscene:text("* It feels as though...[wait:5]")
            cutscene:text("* [speed:0.05]...")
            cutscene:text("* ...Jimmy...[wait:30] no...")
            cutscene:text("* YOU !!![wait:5] You rustled Jimmy,[wait:5] \ndidn't you ??!?")
            cutscene:wait(1)
            cutscene:text("* Well, GOOD.[wait:5][sound:ominous_cancel] None of us really liked him anyway.")
            cutscene:text("* Zah ha ha!")
            Game.world.music:resume()
        end
        cutscene:setSprite(colonel, "idle") 
    end;

    disgustingspikes = function(cutscene, event)
        if event.interact_count == 1 then
            cutscene:wait(cutscene:text("* (More spikes.)"))
            Game:setFlag("disgusting_spikes", true)
        elseif event.interact_count == 2 then
            cutscene:wait(cutscene:text("* (More spikes in a farmer's field ??!?)"))
        elseif event.interact_count >= 3 then
            cutscene:wait(cutscene:text("* (Disgusting.)"))
        end
    end;

    disgustingSpikesAttack = function(cutscene, event)
        if (Game:getFlag("disgusting_spikes", false)) == true and (Game:getFlag("foughtDisgustingSpikes", false)) == false then
            Game:setFlag("disgustingSpikesAttack", true)
        elseif (Game:getFlag("disgusting_spikes", false)) == true and (Game:getFlag("foughtDisgustingSpikes", false)) == true then
            return
        end
    end;

    gardner_chase = function(cutscene, event)
        local vess = cutscene:getCharacter("vess")
        local turn_vess = function(speed)
            cutscene:look(vess, "down")
            cutscene:wait(speed)
            cutscene:look(vess, "left")
            cutscene:wait(speed)
            cutscene:look(vess, "up")
            cutscene:wait(speed)
            cutscene:look(vess, "right")
            cutscene:wait(speed)
        end
        --cutscene:text("[speed:0.4]* Do you[wait:5] know how it feels[wait:5] to defy a fate deemed unavoidable?")
        cutscene:text("[speed:0.4]* Do you know[wait:5] how it feels[wait:5] to finally[wait:4] breathe?")
        cutscene:wait(0.5)
        turn_vess(0.75)
        cutscene:text("[speed:0.4]* To finally breathe[wait:4] the fresh air?")
        cutscene:text("[speed:0.4]* To move[wait:4] an unfamiliar movement?")
        cutscene:text("[speed:0.4]* To defy[wait:5] a fate deemed[wait:4] unavoidable?")
        cutscene:wait(turn_vess(0.5))
        cutscene:text("[speed:0.4]* Do you know...")
        cutscene:wait(turn_vess(0.3))
        cutscene:text("[speed:0.4]* ...[wait:5]the joys...")
        cutscene:wait(turn_vess(0.15))
        --cutscene:wait(0.2)
        Assets.playSound("noise")
        cutscene:fadeOut(0)

        cutscene:detachCamera()
        cutscene:wait(cutscene:panTo("gardner_camera"), 0)
        local gardner = cutscene:spawnNPC("gardner", 1500, 1420)
        --gardner:setHitbox(8, 52, 22, 14) --Smaller hitbox for game feel --Doesn't work
        cutscene:setSpeaker(gardner)

        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:fadeIn(0)
        cutscene:wait(0.8)
        Assets.playSound("tensionhorn")
        cutscene:wait(cutscene:slideTo(gardner, "gardner_slide", 0.4))
        cutscene:text("[face:smile]* ...[wait:5]of runnin' a farm?")
        local music = Music()
        music:play("gardner1")
        cutscene:wait(2)
        cutscene:setSprite(gardner, "threat_pink")
        cutscene:text("[face:threat_pink]* That's all I have to say \nfor now,[wait:5] sun.")
        music:pause()
        cutscene:wait(2)
        cutscene:setSprite(gardner, "neutral")
        cutscene:text("[face:neutral]* What,[wait:5] no,[wait:5] \"sun\" was used \nas a...[wait:5] gender neutral \nterm there.")
        cutscene:setSprite(gardner, "smile")
        cutscene:text("[face:smile]* Sure,[wait:5] I'm evil.[wait:5] \nBut I'm not a monster!")
        cutscene:setSprite(gardner, "smug")
        cutscene:text("[face:smug]* Fahaha!")
        Assets.playSound("noise")
        cutscene:wait(cutscene:fadeOut(0))
        cutscene:setSprite(gardner, "threat_pink")
        cutscene:slideTo(gardner, "gardner_teleport", 0.1) --Zero-second slide softlocks the game
        cutscene:attachCameraImmediate()
        --cutscene:wait(cutscene:panTo("gardner_teleport"), 0)
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:fadeIn(0)
        cutscene:wait(0.5)
        cutscene:text("[face:threat_pink]* I'd start runnin' if \nI were you.")
        music:stop()
        Game.world.music:play("pursuit1")
        cutscene:enableMovement()
        Game:setFlag("gardner_mid_chase", true)
        cutscene:wait(0.5)
        Game.world:setBattle(true) --Realized i dont need a battleareas layer
        local properties = {
            ["aura"] = false,
            ["chase"] = true,
            ["chasedist"] = 9999,
            ["chasespeed"] = 6,
            ["chasetype"] = "linear",
            ["chasing"] = true,
            ["encounter"] = "colonel_squad",
            ["enemy"] = "gardner",
            ["actor"] = "gardner",
            ["sprite"] = "threat_pink"
        }
        cutscene:getCharacter("gardner"):convertToEnemy(properties)
    end;

    gardner_chase_short = function(cutscene)
        local vess = cutscene:getCharacter("vess")
        local turn_vess = function(speed)
            cutscene:look(vess, "down")
            cutscene:wait(speed)
            cutscene:look(vess, "left")
            cutscene:wait(speed)
            cutscene:look(vess, "up")
            cutscene:wait(speed)
            cutscene:look(vess, "right")
            cutscene:wait(speed)
        end

        Assets.playSound("farmerlaugh")
        cutscene:wait(0.75)
        cutscene:wait(turn_vess(0.2))

        Assets.playSound("noise")
        cutscene:wait(cutscene:fadeOut(0))
        local gardner = cutscene:spawnNPC("gardner", 600, 1420)
        --gardner:setHitbox(8, 52, 22, 14) --Smaller hitbox for game feel --Doesn't work
        cutscene:setSpeaker(gardner)
        cutscene:setSprite(gardner, "threat_pink")
        cutscene:attachCameraImmediate()
        --cutscene:wait(cutscene:panTo("gardner_teleport"), 0)
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:fadeIn(0)
        cutscene:wait(0.5)
        cutscene:text("[face:threat_pink]* I'd start runnin' if \nI were you.")
        Game.world.music:play("pursuit1")
        cutscene:enableMovement()
        Game:setFlag("gardner_mid_chase", true)
        cutscene:wait(0.5)
        Game.world:setBattle(true) --Realized i dont need a battleareas layer
        local properties = {
            ["aura"] = false,
            ["chase"] = true,
            ["chasedist"] = 9999,
            ["chasespeed"] = 6,
            ["chasetype"] = "linear",
            ["chasing"] = true,
            ["encounter"] = "colonel_squad",
            ["enemy"] = "gardner",
            ["actor"] = "gardner",
            ["sprite"] = "threat_pink"
        }
        cutscene:getCharacter("gardner"):convertToEnemy(properties)
    end;

    gardner_caught = function(cutscene)
        cutscene:fadeOut(0)
        Game.world.music:stop()
        Assets.playSound("grab")
        Game:setFlag("gardner_chase_death", true)
        Game:setFlag("#chapter1/farm_world/farm_gardner_test#91:used_once", false)
        Game:setFlag("#chapter1/farm_world/farm_gardner_test#20:used_once", false)
        Game:setFlag("gardner_mid_chase", false)
        Game:saveQuick()
        print("Quicksaved!")
        cutscene:wait(0.75)
        Assets.playSound("farmerlaugh")
        cutscene:wait(0.75)
        --Assets.playSound("hurt")
        --cutscene:wait(0.5)
        --print("Loaded quicksave!")
        --Game:loadQuick(true) --This is redundant. Game over screen loads quicksaves automagically
        Game.world:hurtParty("ALL", 999)
    end;

    setMajorWheatPuzzleFlag = function(cutscene, event)
        Game:setFlag("completedMajorWheatPuzzle", true)
    end;

    majorWheatPuzzle = function(cutscene, event)
        if (Game:getFlag("completedMajorWheatPuzzle", false)) and (Game:getFlag("sawMajorWheatPuzzleCutscene", false)) == false then
            Game:setFlag("sawMajorWheatPuzzleCutscene", true)
            Game.world.music:pause()
            Assets.playSound("moss_fanfare")
            cutscene:wait(2)
            local spike1 = Game.world:getEvent(189)
            local spike2 = Game.world:getEvent(180)
            local spike3 = Game.world:getEvent(181)
            local spike4 = Game.world:getEvent(190)
            local spike5 = Game.world:getEvent(185)
            local spike6 = Game.world:getEvent(186)
            local spike7 = Game.world:getEvent(187)
            local spike8 = Game.world:getEvent(182)
            local spike9 = Game.world:getEvent(183)
            local spike10 = Game.world:getEvent(184)
            local spike11 = Game.world:getEvent(179)
            local options = {
                ["play_sound"] = false
            }
            spike1:explode(0, 0, false)
            spike2:explode(0, 0, false, options)
            spike3:explode(0, 0, false, options)
            spike4:explode(0, 0, false, options)
            spike5:explode(0, 0, false, options)
            spike6:explode(0, 0, false, options)
            spike7:explode(0, 0, false, options)
            spike8:explode(0, 0, false, options)
            spike9:explode(0, 0, false, options)
            spike10:explode(0, 0, false, options)
            spike11:explode(0, 0, false, options)
            Game:setFlag("completeMajorWheatPuzzle", true)
            Game.world.music:resume()
            local colonel = cutscene:getCharacter("colonel", 2)
            local vess = cutscene:getCharacter("vess")
            local options2 = {
                ["talk"] = true;
            }
            cutscene:setSpeaker(colonel, true)
            cutscene:setTextboxTop(false)
            cutscene:look(colonel, "right")
            cutscene:wait(cutscene:alert(colonel, 2))
            cutscene:setSprite(colonel, "talk", 1/6)
            cutscene:text("* Wow,[wait:5] lieutenant !!", nil, colonel, options2)
            cutscene:text("* You got rid of the spikes !!", nil, colonel, options2)
            cutscene:text("* Now we can save our encircled men !!", nil, colonel, options2)
            cutscene:text("* You're promoted to commander,[wait:5] lieutenant !!", nil, colonel, options2)
            cutscene:wait(cutscene:walkTo(colonel, "colonel_run", 2))
        else
            return
        end
    end;

    artilleryWheatPuzzle = function(cutscene, event)
            local colonel = cutscene:getCharacter("colonel", 1)
            cutscene:look(colonel, "right")
            Game:setFlag("sawartilleryWheatPuzzleCutscene", true)
            cutscene:wait(1)
            cutscene:detachCamera()
            cutscene:wait(cutscene:panTo("end_marker", 7, "in-out-quad"))
            cutscene:wait(2)
            cutscene:wait(cutscene:panTo("script_marker", 2, "in-out-quad"))
            cutscene:wait(1)
            local rightColonel = cutscene:getCharacter("colonel", 2)
            local leftColonel = cutscene:getCharacter("colonel", 3)
            local vess = cutscene:getCharacter("vess")
            local options = {
                ["talk"] = true;
            }
            local options2 = {
                ["play_sound"] = false;
            }
            cutscene:setSpeaker(colonel, true)
            cutscene:setTextboxTop(false)
            cutscene:look(colonel, "left")
            cutscene:wait(0.5)
            Game.world.music:pause()
            cutscene:setSprite(colonel, "talk", 1/6)
            cutscene:text("* Lieutenant.", nil, colonel, options)
            cutscene:wait(1)
            cutscene:text("* We're not gonna waste time figuring this puzzle out.", nil, colonel, options)
            cutscene:text("* Lives are at stake.", nil, colonel, options)
            cutscene:wait(1)
            cutscene:text("* This leaves us with only one option.", nil, colonel, options)
            cutscene:wait(cutscene:panTo("artillery_marker"))
            cutscene:text("* Fire.", nil, colonel, options)
            cutscene:setSpeaker(leftColonel, true)
            cutscene:setSprite(colonel, "idle", 1/6)
            cutscene:setSprite(leftColonel, "talk", 1/6)
            cutscene:text("* Sir,[wait:5] yes sir!", nil, leftColonel, options)
            cutscene:setSpeaker(rightColonel, true)
            cutscene:setSprite(leftColonel, "idle", 1/6)
            cutscene:setSprite(rightColonel, "talk", 1/6)
            cutscene:text("* But Colonel,[wait:5] theres civilians there![wait:5] All those wheat and kernels !![wait:5] Grasses, even !!", nil, rightColonel, options)
            cutscene:setSpeaker(colonel, true)
            cutscene:setSprite(colonel, "talk", 1/6)
            cutscene:setSprite(rightColonel, "idle", 1/6)
            cutscene:text("* We warned them to evacuate days before the operation...[wait:5] They should've been gone long ago.", nil, Colonel, options)
            cutscene:text("* Plus,[wait:5] this is enemy territory.[wait:5] For all we know,[wait:5] they could be loyal to the GARDNER. ", nil, Colonel, options)
            cutscene:text("* FIRE!!!! ", nil, Colonel, options)
            cutscene:setSpeaker(leftColonel, true)
            cutscene:setSprite(colonel, "idle", 1/6)
            cutscene:setSprite(leftColonel, "talk", 1/6)
            cutscene:text("* YOU HEARD THE MAN !![wait:5] FIRE EVERYTHING !!", nil, leftColonel, options)
            cutscene:setSpeaker(rightColonel, true)
            cutscene:setSprite(leftColonel, "idle", 1/6)
            cutscene:setSprite(rightColonel, "talk", 1/6)
            cutscene:text("* NOOOOO !!!!!", nil, rightColonel, options)
            cutscene:wait(cutscene:fadeOut(1, {color = {1, 1, 1}}))
            cutscene:wait(cutscene:panTo("script_marker", 0.05))
            cutscene:panTo("end_marker", 14)
            cutscene:fadeIn(1)
            for i = 1, 400 do
                local random_x = love.math.random(529, 4910) -- pick random coordinates
                local random_y = love.math.random(130, 665)
                local explode_point = cutscene:spawnNPC("blanknpc", random_x, random_y) --you cant just spawn an explosion, you have to spawn an object and explode it. but you CANT SPAWN AN OBJECT (I THINK), SO YOU HAVE TO SPAWN AN NPC!!! THIS IS DUMB"!!!!! THIS SIS STUPDIU!!!!!!!!!!!!

                explode_point:explode(0, 0, false, options2)

                if love.math.random() < 0.15 then
                    Assets.playSound("explosion") 
                end
                cutscene:wait(0.025)
            end
            cutscene:setSprite(rightColonel, "idle", 1/6)
            cutscene:setSprite(colonel, "idle", 1/6)
            cutscene:wait(cutscene:fadeOut(2, {color = {1, 1, 1}}))
            Game.world:loadMap("chapter1/farm_world/farm10_real", "spawn")
            cutscene:wait(2)
            cutscene:wait(cutscene:fadeIn(3))
            cutscene:wait(cutscene:attachCamera())
    end;

    rescue_colonel = function(cutscene, event)
        if (Game:getFlag("rescuedColonel", false)) == false then
            Game:setFlag("rescuedColonel", true)
            Game.world.music:pause()
            Assets.playSound("moss_fanfare")
            cutscene:wait(2)
            local spike1 = Game.world:getEvent(212)
            local spike2 = Game.world:getEvent(213)
            local spike3 = Game.world:getEvent(216)
            local spike4 = Game.world:getEvent(215)
            local spike5 = Game.world:getEvent(214)
            local spike6 = Game.world:getEvent(207)
            local spike7 = Game.world:getEvent(210)
            local spike8 = Game.world:getEvent(211)
            local options = {
                ["play_sound"] = false
            }
            spike1:explode(0, 0, false)
            spike2:explode(0, 0, false, options)
            spike3:explode(0, 0, false, options)
            spike4:explode(0, 0, false, options)
            spike5:explode(0, 0, false, options)
            spike6:explode(0, 0, false, options)
            spike7:explode(0, 0, false, options)
            spike8:explode(0, 0, false, options)
            Game.world.music:resume()
            local colonel = cutscene:getCharacter("colonel", 1)
            local vess = cutscene:getCharacter("vess")
            local options2 = {
                ["talk"] = true;
            }
            cutscene:setSpeaker(colonel, true)
            cutscene:setTextboxTop(false)
            cutscene:wait(cutscene:alert(colonel, 1))
            cutscene:setSprite(colonel, "talk", 1/6)
            cutscene:text("* Private !![wait:5] You saved me !!", nil, colonel, options2)
            cutscene:text("* You got rid of the spikes !!", nil, colonel, options2)
            cutscene:wait(1)
            cutscene:text("* ...I didn't really have anything important to do,[wait:5] though...", nil, colonel, options2)
            cutscene:wait(1)
            cutscene:text("* ...and now you have to restart the puzzle.", nil, colonel, options2)
            cutscene:wait(2)
            cutscene:text("* Thanks though.", nil, colonel, options2)
        else
            return
        end
    end;
}