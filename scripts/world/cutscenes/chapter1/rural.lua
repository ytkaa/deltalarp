return {
    start_day = function(cutscene, event)
        cutscene:text("* (Start the day?)")
        local start = cutscene:choicer({"Yes", "Noooo"})

        if start == 1 then
            cutscene:text("* (...)")
            cutscene:text("* (...[wait:5]we haven't implemented\nthat yet.)")
        else
            cutscene:text("* (Then,[wait:5] the [color:pink][style:GONER]LARPERS' RUNE[color:reset][style:none][wait:5] will\nbe waiting.)")
        end
    end
}