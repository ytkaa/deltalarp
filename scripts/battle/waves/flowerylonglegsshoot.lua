local flowerylonglegsstomp, super = Class(Wave)

function flowerylonglegsstomp:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 10
end

function flowerylonglegsstomp:onStart()
    -- Get all enemies that selected this wave as their attack
    local enemies = self:getAttackers()
    start_x = SCREEN_WIDTH / 2
    start_y = 0
    local bullet = self:spawnBullet("FloweryLongLegsFlower", start_x, start_y)
end


function flowerylonglegsstomp:update()
    super.update(self)
end

return flowerylonglegsstomp