return {
    intro = function(cutscene)
        cutscene:fadeOut(0)
        cutscene:wait(3)
        Assets.playSound("dtrans_lw")
        cutscene:wait(cutscene:fadeIn(2.5))
        cutscene:wait(1.5)
        Game.world:getEvent(5):remove()
        Assets.playSound("intro1")
        cutscene:wait(4)
        Game.world:mapTransition("fileselect")
    end
}