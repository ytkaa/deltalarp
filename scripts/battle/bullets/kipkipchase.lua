---@class KipkipChase : Bullet
local KipkipChase, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function KipkipChase:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/kipkip/kipkip")
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 3
    self.physics.match_rotation = true
    local x = math.random(249, 391)
    local y = math.random(100, 240)
end

function KipkipChase:onCollide(soul) --stops bullet from disappearing when hitting the soul
    self.destroy_on_hit = false
    super.onCollide(self, soul)
end

function KipkipChase:update()
    local target_angleSpecial = MathUtils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
    self.rotation = target_angleSpecial
    self.physics.direction = target_angleSpecial
    self.physics.match_rotation = true
    self.physics.speed = 2
    self.element = "plant"
    super.update(self)
    --if self.timer then
    --    self.timer:update()
    --end

--    local dx = Game.battle.soul.x - self.x
--    local dy = self.targety - self.y
--    local dist = math.sqrt(dx * dx + dy * dy) --gets the distance 
--    if dist <= 10 then
 --       self.x = Game.battle.soul.x
 --       self.y = Game.battle.soul.y
--        self.physics.speed = 0
--    else
--        self.physics.speed = 3
--    end

end

return KipkipChase
