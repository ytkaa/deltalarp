return {
    jeer = function(cutscene, grace, zobate)
        cutscene:text("* Grace jeered!")
        cutscene:battlerText(grace, "Boooo!")
        zobate:addMercy(-6)
        cutscene:text("* Zobate is offended!")
        cutscene:text("* His defense is lowered during the next two turns!")
    end;
}