local PlayerRacingState, super = Class(StateClass)

function PlayerRacingState:init(player)
    self.player = player

    self.racing_sound = Assets.newSound("paper_surf")
    self.racing_sound:setLooping(true)

    self.acceleration = 0.6
    self.friction = 0.965
    self.max_speed = 16

    self.velocity_x = 0
    self.velocity_y = 0

    self.last_horizontal = 1
end

function PlayerRacingState:registerEvents()
    self:registerEvent("enter", self.onEnter)
    self:registerEvent("update", self.onUpdate)
    self:registerEvent("leave", self.onExit)
    self:registerEvent("remove", self.onRemove)
end

function PlayerRacingState:handleMovement()
    local x = 0
    local y = 0

    if self.player:isMovementEnabled() then
        if Input.down("right") then x = x + 1 end
        if Input.down("left") then x = x - 1 end
        if Input.down("down") then y = y + 1 end
        if Input.down("up") then y = y - 1 end
    end

    self.velocity_x = self.velocity_x + x * self.acceleration * DTMULT
    self.velocity_y = self.velocity_y + y * self.acceleration * DTMULT

    local speed = MathUtils.dist(0, 0, self.velocity_x, self.velocity_y)

    if speed > self.max_speed then
        self.velocity_x = self.velocity_x / speed * self.max_speed
        self.velocity_y = self.velocity_y / speed * self.max_speed
    end

    self.velocity_x = self.velocity_x * (self.friction ^ DTMULT)
    self.velocity_y = self.velocity_y * (self.friction ^ DTMULT)

    if self.velocity_x ~= 0 or self.velocity_y ~= 0 then
        local speed = MathUtils.dist(0, 0, self.velocity_x, self.velocity_y)

        self.player:move(self.velocity_x / speed, self.velocity_y / speed, speed * DTMULT)
    end
end

function PlayerRacingState:handleSprites()
    local x = self.velocity_x
    local y = self.velocity_y
    local deadzone = 0.2

    if math.abs(x) < deadzone then x = 0 end
    if math.abs(y) < deadzone then y = 0 end

    if x > 0 then
        self.last_horizontal = 1
    elseif x < 0 then
        self.last_horizontal = -1
    end

    if y < 0 then
        if self.last_horizontal < 0 then
            self:animate("racing/down_left")
        else
            self:animate("racing/down_right")
        end

    elseif y > 0 then
        if self.last_horizontal < 0 then
            self:animate("racing/down_left")
        else
            self:animate("racing/down_right")
        end

    elseif x < 0 then
        self:animate("racing/down_left")

    elseif x > 0 then
        self:animate("racing/down_right")
    end
end

function PlayerRacingState:animate(sprite)
    local play = false

    if self.player.sprite.anim_sprite ~= sprite then
        play = true
    end
    if play then
        self.player.sprite:setAnimation(sprite)
        self.player.sprite:play(1/3, false)
        self.player.sprite.anim_callback = function() self.player.sprite:setFrame(3) end
    end
end

function PlayerRacingState:onEnter()
    Assets.playSound("grab")
    self.racing_sound:play()
    --self.player.sprite:setAnimation("racing")
    self.player.auto_moving = true

    for _, follower in ipairs(Game.world.followers) do
        follower.sprite.alpha = 0
    end
end

function PlayerRacingState:onUpdate()
    if Game:getFlag("speedBoost") then
        self.acceleration = 4
        self.max_speed = 32
    elseif Game:getFlag("speedBoost") == false then
        self.acceleration = 0.6
        self.max_speed = 16
    end
    self:handleMovement()
    self:handleSprites()
end

function PlayerRacingState:onExit(next_state)
    Assets.playSound("item")
    self.player:resetSprite()
    self.racing_sound:stop()

    self.player.auto_moving = false

    for _, follower in ipairs(Game.world.followers) do
        follower.sprite.alpha = 1
    end

    self.velocity_x = 0
    self.velocity_y = 0

    self.last_horizontal = 1
end

function PlayerRacingState:onRemove()
    self.racing_sound:stop()
end

return PlayerRacingState