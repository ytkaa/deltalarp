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
        
        cutscene:wait(cutscene:text("* Oh my GOD.", options))
        cutscene:panTo(320, 420)
        cutscene:wait(cutscene:walkTo(grace, 320, 340, 2))
        cutscene:wait(cutscene:text("* So YOU were the one taking food from the barn.", options))

        cutscene:wait(cutscene:text("* That's why there's been less food for[wait:5] me recently...", options))
        cutscene:wait(cutscene:text("* Hah.[wait:5] Okay.[wait:5] That's cool.[wait:5]", options))
        
        cutscene:panTo(320, 500)
        cutscene:wait(cutscene:walkTo(grace, 320, 420, 2.5))
        cutscene:wait(cutscene:text("* You creepy #$$@#."))
        music:play("grace")
        cutscene:wait(2)
        cutscene:wait(cutscene:text("* This is why nobody likes you."))
        cutscene:wait(cutscene:text("* Ugh...[wait:5] of course its YOUR fault I've had to...[wait:5] to...", options))
        music:stop()
        --Assets.playSound("grace_surprise_wip")
        cutscene:wait(2)
        cutscene:wait(cutscene:text("* What?[wait:5] Why am I dressed like this?", options))
        cutscene:wait(cutscene:text("* Why is the inside of this barn so dark?", options))
        cutscene:wait(cutscene:text("* Hah,[wait:5] I don't know either", auto))
        music:play("grace")
        cutscene:wait(cutscene:text("* Wait,[wait:5] no,[wait:5] I don't like you,[wait:5] we're NOT talking."))
        cutscene:wait(cutscene:text("* Just...[wait:5] go away."))
        cutscene:wait(cutscene:text("* I don't need you stealing more food that I found fair and $$$$ing square."))
        cutscene:wait(cutscene:text("* $$!$ is hard enough to come by already."))
        music:stop()
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
            cutscene:text("* No you're not !![wait:5] You seem a little too...[wait:5] animated,[wait:5] for his tastes.")
        else 
            cutscene:text("* Heh.[wait:5] I knew that,[wait:5] lietenant!")
            cutscene:text("* You just seem a little too...[wait:5] animated,[wait:5] for his tastes.")
        end
        cutscene:text("* And regardless,[wait:5] that old Gardner likes to work alone !!")
        cutscene:text("* He works alone to \"harvest the crops.\"[wait:5] That's how he puts it.")
        cutscene:text("* Lieutenant,[wait:5] when you meet that Gardner,[wait:5] don't run away !!")
        cutscene:text("* Stand your ground,[wait:5] and...[wait:5] give him hell,[wait:5] you hear me !!")

        cutscene:setSprite(colonel, "idle")
        Game.world.music:resume()
    end;
}