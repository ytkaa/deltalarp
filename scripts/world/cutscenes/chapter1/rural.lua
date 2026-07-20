return {
    start_day = function(cutscene, event)
        cutscene:text("* (Start the day?)")
        local start = cutscene:choicer({"Yes", "Noooo"})

        if start == 1 then
            --cutscene:text("* (...)")
            --cutscene:text("* (...[wait:5]we haven't implemented\nthat yet.)")
            Game:setFlag("start_cutscene_active", true) --prevents premature room transitions

            cutscene:wait(cutscene:fadeOut(3))
            cutscene:wait(Game.world:mapTransition("chapter1/rural_mainstreet"))
            local music = Music()
            music:play("start")
            music:setLooping(false)
            cutscene:wait(cutscene:fadeIn(1))
            cutscene:wait(cutscene:walkTo("vess", "vess_target_start", 41, "up")) --41, top of mainstreet
            Game:setFlag("start_cutscene_active", false)
            --cutscene:wait(Game.world:mapTransition("chapter1/rural_school"))
            cutscene:wait(0.5)
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
            cutscene:wait(3)
            
            
            cutscene:text("* (All according[sound:bageldefeat] to[next]")
            cutscene:wait(cutscene:text("* [wave][style:GONER](All according to plant!)"))
            cutscene:wait(cutscene:fadeIn(1))
            cutscene:text("* [wave](oh, you're stuck in the wall...)")
            cutscene:text("* [wave](oh[wait:5].[wait:5].[wait:5].)")
            cutscene:wait(Game.world:mapTransition("chapter1/rural_school"))
            Game:setFlag("start_cutscene_active", false)
            Assets.playSound("egg")

            
        else
            cutscene:text("* (Then,[wait:5] the [color:pink][style:GONER]LARPERS' RUNE[color:reset][style:none][wait:5] will\nbe waiting.)")
        end
    end
}