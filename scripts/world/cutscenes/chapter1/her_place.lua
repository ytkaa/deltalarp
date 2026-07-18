return {
    her_place = function(cutscene, depths)
        --Function for Gaster style unskippable text
        local function dialogue(text)
            local dialogueText = DialogueText("[style:GONER][color:#f0e4f7][speed:0.25][voice:none]" .. text, 160, 120, 400, 240)
            Game.world:addChild(dialogueText)
            dialogueText.layer = 6
            dialogueText.advance_callback = function() dialogueText:remove() end
            cutscene:wait(function() return dialogueText:isRemoved() end)
        end

        cutscene:wait(7)

        dialogue("ARE YOU [wait:40]AWAKE.[wait:2].[wait:2]?")
        dialogue("ARE YOU [wait:40]TOGETHER.[wait:2].[wait:2]?")
        dialogue("COME ON,[wait:5] FRIEND...")
        dialogue("DON'T BE SHY..!")
        dialogue("I WILL MAKE YOU FEEL [wait:20]WHOLE[wait:20] AGAIN.")
        dialogue("BUT,[wait:20] YOU MUST PLAY ALONG...")
        dialogue("PLAY ALONG [wait:20]WITH US!")
        dialogue("LET'S[wait:2] PLAY...")

        depths.music:stop()
        cutscene:wait(1)

        --Summons pink soul using gonermaker library
        local soul = SoulAppearance(320, 240)
        soul.layer = 3
        Game.world:addChild(soul)

        cutscene:wait(3)

        dialogue("[speed:0.15]A GAME[wait:5] OF MAKE-BELIEVE.")
        dialogue("[speed:0.20]COME FORTH,[wait:5] MY[wait:10] VESSEL!")

        local tunes = Music()
        tunes:play("Her")
        tunes:setPitch(0.2)

        cutscene:wait(2)
        cutscene:wait(cutscene:walkTo("vess", "vess_target1", 6))
        cutscene:wait(3)
        
        
        --Assets.playsound("reverse_crash_6andahalf")
        cutscene:playSound("reverse_crash_6andahalf")
        cutscene:wait(1)
        cutscene:walkTo("vess", "vess_target2", 6)
        cutscene:wait(1)
        cutscene:wait(cutscene:fadeOut(4.5, { color = COLORS.white, global = true }))
        
        --loadMap doesn't work.
        tunes:stop();
        Game.world:mapTransition("chapter1/rural1")
        
        --cutscene:text("[style:GONER][speed:0.25]QUADO[wait:10].[wait:10].[wait:10]. [wait:40]TRADE ON IT.")
        --local dialogueText = DialogueText("[style:GONER][speed:0.25]QUADO[wait:10].[wait:10].[wait:10]. [wait:40]TRADE ON IT.", 160, 120)
        --local dialogueText = DialogueText("[style:GONER][speed:0.25][noskip]ARE YOU\n[wait:40]AWAKE..?", 160, 120, TextSettings.align("center"))
        --dialogueText.layer = 6
        --Game.stage:addChild(dialogueText)
        --cutscene:wait(10)
    end
}