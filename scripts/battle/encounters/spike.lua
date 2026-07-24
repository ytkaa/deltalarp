local spike, super = Class(Encounter)

function spike:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Spike appears."

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("spike")
end

return spike