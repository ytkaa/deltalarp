local flowerylonglegsstompcrazy, super = Class(Wave)

function flowerylonglegsstompcrazy:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
end

function flowerylonglegsstompcrazy:onStart()
    -- Get all enemies that selected this wave as their attack
    local enemies = self:getAttackers()
    start_x = SCREEN_WIDTH / 2
    start_y = -200
    local bullet = self:spawnBullet("FloweryLongLeg1crazy", start_x, start_y)
    local bullet = self:spawnBullet("FloweryLongLeg2crazy", start_x, start_y)
end


function flowerylonglegsstompcrazy:update()
    super.update(self)
end

return flowerylonglegsstompcrazy