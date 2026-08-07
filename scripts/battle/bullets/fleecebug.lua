---@class FleecebugBullet : Bullet
local FleecebugBullet, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
local targetx = math.random(249, 391)
local targety = math.random(100, 240)
function FleecebugBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/fleecebug/fleecebug")
    self.physics.match_rotation = true
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 3

    self.timer = Timer()

        self.timer:everyInstant(math.random(2, 3), function()
            local x, y = SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2
            self.targetx = math.random(249, 391)
            self.targety = math.random(100, 240)
            local target_angle = MathUtils.angle(self.x, self.y, self.targetx, self.targety)
            self.physics.direction = target_angle
            self.rotation = target_angle
        end)
end

function FleecebugBullet:onCollide(soul) --stops bullet from disappearing when hitting the soul
    self.destroy_on_hit = false
    super.onCollide(self, soul)
end

function FleecebugBullet:update()
    if self.timer then
        self.timer:update()
    end

    local dx = self.targetx - self.x
    local dy = self.targety - self.y
    local dist = math.sqrt(dx * dx + dy * dy) --gets the distance 
    if dist <= 10 then
        self.x = self.targetx
        self.y = self.targety
        self.physics.speed = 0
    else
        self.physics.speed = 3
    end

    super.update(self)
end

return FleecebugBullet
