---@class FloweryLongLeg2crazy : Bullet
local FloweryLongLeg2crazy, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function FloweryLongLeg2crazy:init(x, y, dir, speed)
    super.init(self, SCREEN_WIDTH / 2, -200, "bullets/flowerylonglegs/leg2")
    self.timer = Timer()
        self.timer:everyInstant(1, function()
            self.target_x = math.random(320, 391)
            self.target_y = 120
            self.start_x = self.x
            self.start_y = self.y
            
            self.arc_timer = 0
            self.arc_duration = 25 -- Duration of the stomp in frames
            self.peak_height = 65  -- How high the arc curves upward

            self.moving = true
            Game.battle:shakeCamera()
            Assets.playSound("bump")
        end)

    self.element = "plant"
end

function FloweryLongLeg2crazy:onCollide(soul) --stops bullet from disappearing when hitting the soul
    self.destroy_on_hit = false
    super.onCollide(self, soul)
end

function FloweryLongLeg2crazy:update()
    if self.timer then
        self.timer:update()
        if self.moving then
            self.arc_timer = self.arc_timer + DTMULT

            local progress = math.min(1, self.arc_timer / self.arc_duration)

            self.x = self.start_x + (self.target_x - self.start_x) * progress

            local arc_y = self.peak_height * -4 * (progress - 0.5)^2 + self.peak_height
            local linear_y = self.start_y + (self.target_y - self.start_y) * progress
            self.y = linear_y - arc_y

            if progress >= 1 then
                self.start_x = self.x
                self.start_y = self.y
                self.moving = false
            end
        end
    end
    super.update(self)
end

return FloweryLongLeg2crazy
