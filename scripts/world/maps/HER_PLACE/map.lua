local HER_PLACE, super = Class(Map)

function HER_PLACE:onEnter()
    super.onEnter(self)

    -- do whatever in here
    -- spawn an object, set the layer

    local background = DepthsBackground()
    background.layer = 2 -- set this to whatever makes sense
    Game.world:addChild(background) -- add it to something

    local soul = SoulAppearance(320, 240) -- center it in the screen
    soul.layer = 3 -- set this to whatever makes sense
    Game.world:addChild(soul)

    Game.world.player:setLayer(4)
    Game.world.player:setFacing("up")
    

    local dialogueText = DialogueText("[style:GONER][speed:0.25]QUADO[wait:10].[wait:10].[wait:10]. [wait:40]TRADE ON IT.", 160, 120)
    dialogueText.layer = 6
    Game.stage:addChild(dialogueText) -- or anything relevant
end

return HER_PLACE