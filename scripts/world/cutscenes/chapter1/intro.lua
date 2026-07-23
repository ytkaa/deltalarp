return {
    intro = function(cutscene)
        --local skipped = false;
        cutscene:during(function()
            if Input.pressed("confirm") then
                Assets.stopAllSounds()
                Game.world:mapTransition("fileselect")
                cutscene:fadeIn(1)
                Game.world:stopCutscene()
            end
        end, true)

        cutscene:fadeOut(0)
        --cutscene:wait(2)
        Assets.playSound("dtrans_lw")
        cutscene:wait(0.5)
        cutscene:wait(cutscene:fadeIn(1.75))
        cutscene:wait(1.75)
        Game.world:getEvent(5):remove()
        Assets.playSound("intro1")
        cutscene:wait(4)
        cutscene:wait(cutscene:fadeOut(3))
        cutscene:wait(1)
        cutscene:wait(Game.world:loadMap("fileselect"))
        cutscene:fadeIn(0.5)
    end
}