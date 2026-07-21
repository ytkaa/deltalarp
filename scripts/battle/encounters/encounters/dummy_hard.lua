local dummy_hard, super = Class(Encounter)

function dummy_hard:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The TRUE battle begins...?"

    -- Battle music ("battle" is rude buster)
    self.music = "rebattle4"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("dummy")

    --- Uncomment this line to add another!
    self:addEnemy("dummy")
    self:addEnemy("dummy")
    self:addEnemy("dummy")
end

return dummy_hard
