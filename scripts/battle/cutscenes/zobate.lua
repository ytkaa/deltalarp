return {
    jeer = function(cutscene, grace, zobate)
        cutscene:text("* Grace jeered!")
        cutscene:battlerText(grace, "Boooo!")
        zobate:addMercy(-6)

        cutscene:text("* Zobate is offended!")
        Assets.playSound("bell_bounce_short")
        zobate:flash()
        zobate.jeer_timer = 3
        zobate.defense = 0
        zobate.check = {
            "AT 8 DF 0\n* Offended.",
        }
        cutscene:text("* His DEFENCE is reduced for the next two turns!")
    end;
}