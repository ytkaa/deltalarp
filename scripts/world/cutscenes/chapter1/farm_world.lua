return {
    grace_intro = function(cutscene, event)
        cutscene:detachCamera()
        cutscene:spawnNPC("grace", 320, 200)
        cutscene:look("grace", "up")
        cutscene:look("vess", "up")
        cutscene:wait(1)
        cutscene:wait(cutscene:panTo("grace_intro"))
        cutscene:wait(1)
        cutscene:look("grace", "down")
        cutscene:wait(1)
        cutscene:alert("vess", 1)
        local options = {
            ["top"] = false
        }
        cutscene:wait(cutscene:alert("grace", 1))
        cutscene:wait(cutscene:text("* All according to plant.", options))
        cutscene:walkTo("grace", "grace_leaf", 2)
        cutscene:wait(1)
        cutscene:wait(cutscene:attachCamera())
        cutscene:getCharacter("grace"):remove()
        print("She gone")
    end
}