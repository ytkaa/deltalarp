---@class KipkipChase : Bullet
local KipkipChase, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
local spamZ = Text("[color:#565656]SPAM <->!", 0, 0)
local confirm_count = 0
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
    self.attachedToSoul = false
    self.element = "plant"
    spamZ:setScale(0)
    Game.stage:addChild(spamZ)
    self.shakenOff = false

    self.timer = Timer()
    self.timer:everyInstant(math.random(0.55), function()
        if self.attachedToSoul == true then
            Game.battle:hurt(5, true)
        end
    end)
end

function KipkipChase:onCollide(soul)
    self.destroy_on_hit = false
    if self.shakenOff == true then
        return
        print("OH MY GOODNESS!!!")
    elseif self.shakenOff == false then
        self.attachedToSoul = true
        print("Lmao kil lyourself")
    end
end

function KipkipChase:update()
    if self.shakenOff == true then
        local target_angleSpecial = 0
        self.physics.direction = target_angleSpecial
        self.physics.speed = 0
    elseif self.attachedToSoul == false then
        local target_angleSpecial = MathUtils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
        self.rotation = target_angleSpecial
        self.physics.direction = target_angleSpecial
        self.physics.match_rotation = true
        self.physics.speed = 3
    elseif self.attachedToSoul == true then
        --change sprite
        self.rotation = 0
        self.physics.speed = 0
        self.x, self.y = Game.battle.soul.x, Game.battle.soul.y
        spamZ.x, spamZ.y = Game.battle.soul.x-23, Game.battle.soul.y-30
        spamZ:setScale(0.50)
        local originalSelf = self -- <-- Mod:onKeyPressed is technically another class, so just using "self" would only refer to onKeyPressed's properties. therefore you need a new "self" variable for the bullet
        function Mod:onKeyPressed(key)
            if Input.is("left", key) or Input.is("right", key) then -- this needs to be changed so that you cant just hold them down
                Assets.playSound("bump", 1.5, 1)
                Game.battle.soul:shake()
                confirm_count = confirm_count + 0.1
                if confirm_count >= 3 then
                    originalSelf.attachedToSoul = false
                    Mod.onKeyPressed = nil
                    if spamZ then
                        Game.stage:removeChild(spamZ)
                    end
                    confirm_count = 0
                    originalSelf.shakenOff = true
                    originalSelf:setColor({0.33, 0.33, 0.33})
                    originalSelf.timer:every(3, function()
                        originalSelf.shakenOff = false
                        originalSelf:setColor(COLORS.white) 
                    end)
                end
            end
        end
    end
    super.update(self)
    if self.timer then
        self.timer:update()
    end
end

function KipkipChase:onRemove()
    if spamZ then
        Game.stage:removeChild(spamZ)
    end
    Mod.onKeyPressed = nil
    super.onRemove(self)
end

return KipkipChase
