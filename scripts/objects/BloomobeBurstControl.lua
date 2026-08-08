---@class BloomobeBurstControl : Event
---@field group     integer     *[property `group`]* Which trigger activates this
local BloomobeBurstControl, super = Class(Event)

function BloomobeBurstControl:init(x, y, properties)
    super.init(self, x, y, 40, 40)
    self.solid = false
    self:setOrigin(0.50, 0.5)

    self.cooldowned = false
    self.cooldown = properties["cooldown"] or 2.5
    self.cooldown_diff = properties["cooldown_diff"] or 0.5
end

function BloomobeBurstControl:update()
    local chara = self.world.player
    super.update(self)

    if not self.cooldowned then
        local x = chara.x + math.random(200, 300)
        if math.random() > 0.5 then x = chara.x - math.random(200, 300) end
        local y = chara.y - math.random(100, 200)

        if x < 120 then
            x = chara.x + math.random(200, 300)
        elseif x > 900 then
            x = chara.x - math.random(200, 300)
        end

        --print(x, y) --Debug

        self.cooldowned = true

        if chara.y > 1680 then
            self.world.timer:after(self.cooldown, function() self.cooldowned = false end)
        elseif chara.y > 1180 then
            self.world.timer:after(self.cooldown - self.cooldown_diff, function() self.cooldowned = false end)
        else
            self.world.timer:after(self.cooldown - (self.cooldown_diff * 2), function() self.cooldowned = false end)
        end
        
        
        if y > 670 then
            local burst = BloomobeBurst(x, y)
            burst.layer = chara.layer
            self.world:addChild(burst)
            Assets.playSound("ghostappear", 1, 1.5)
        end
    end
end

return BloomobeBurstControl