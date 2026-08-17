return {
    grace_hay = function(cutscene, grace)
        Game.battle:setState("CUTSCENE")
        cutscene:after(function() Game.battle:setState("ACTIONS") end)
        Assets.playSound("error")
        cutscene:text("* Grace refused to eat the HAY!")
        cutscene:setSpeaker(grace)
        cutscene:text("[face:kawaii_brow, -19, -13]* I'm good.")
        cutscene:setSpeaker(nil)
        cutscene:text("[sound:laz_c][wait:20]* Grace vaporized the HAY!")
    end;

    grace_use_hay = function(cutscene, grace)
        Game.battle:setState("CUTSCENE")
        cutscene:after(function() Game.battle:setState("ACTIONS") end)
        cutscene:setSpeaker(grace)
        cutscene:text("[face:brow, -19, -13]* ...")
        cutscene:setSpeaker(nil)
        cutscene:text("[sound:laz_c][wait:20]* Grace vaporized the HAY!")
    end;
}