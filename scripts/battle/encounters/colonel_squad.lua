local Colonel, super = Class(Encounter)

function Colonel:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The squad conducts a special military operation!"

    -- Battle music ("battle" is rude buster)
    self.music = "petal_limiter"
    -- Enables the purple grid battle background
    self.background = true

    self:addEnemy("colonel")
    self:addEnemy("colonel")
    self:addEnemy("colonel")
    self:addEnemy("colonel")
    self:addEnemy("colonel")
end

return Colonel