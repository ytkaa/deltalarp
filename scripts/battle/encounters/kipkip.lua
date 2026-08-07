local Kipkip, super = Class(Encounter)

function Kipkip:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    if Game:getFlag("isCarryingTreasure") then
        self.text = "* Kipkip tries to nab your treasure! Also, you're overencumbered."
    else
        self.text = "* Kipkip sprouts from the ground!"
    end

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("kipkip")
end

return Kipkip