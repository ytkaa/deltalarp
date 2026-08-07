local Flowerylonglegs, super = Class(Encounter)

function Flowerylonglegs:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Flowery Long Legs drops down!"

    -- Battle music ("battle" is rude buster)
    Game.music:stop()
    self.music = "flower_spider_wip"
    -- Enables the purple grid battle background
    self.background = true

    local enemy = self:addEnemy("flowerylonglegs", 210, 109)
end

function Flowerylonglegs:getPartyPosition(index) --it has to be like this for some reason
    if index == 1 then
        return 214, 315  -- Position for the first party member
    elseif index == 2 then
        return 428, 326  -- Position for the second party member
    else
        return Flowerylonglegs:getPartyPosition(self, index) -- Default positions for others
    end
end

function Flowerylonglegs:onBattleStart()
    Game.battle:setState("ENEMYDIALOGUE")   
    if Kristal.Config then
        Kristal.Config["growStronger"] = false
    end
end

function Flowerylonglegs:onBattleEnd()
    Game:setFlag("killedFloweryLongLegs", true)
    if Kristal.Config then
        Kristal.Config["growStronger"] = true
    end
end

return Flowerylonglegs