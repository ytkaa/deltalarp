return {
    start_day = function(cutscene, event)
        cutscene:text("* (Start the day?)")
        local start = cutscene:choicer({"Yes", "Noooo"})

        if start == 1 then
            --cutscene:text("* (...)")
            --cutscene:text("* (...[wait:5]we haven't implemented\nthat yet.)")
            cutscene:wait(cutscene:fadeOut(3))
            cutscene:wait(Game.world:mapTransition("chapter1/rural_mainstreet"))
            cutscene:wait(cutscene:fadeIn(1))
            cutscene:text("* (All according[sound:bageldefeat] to[next]")
            cutscene:text("* [wave][style:GONER](All according to plant!)")
            local music = Music()
            music:play("start")
        else
            cutscene:text("* (Then,[wait:5] the [color:pink][style:GONER]LARPERS' RUNE[color:reset][style:none][wait:5] will\nbe waiting.)")
        end
    end
}