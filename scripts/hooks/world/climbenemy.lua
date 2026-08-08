local ClimbEnemy, super = HookSystem.hookScript(ClimbEnemy)

--- Spawns effects when this enemy is attacked.
function ClimbEnemy:spawnAttackEffects()
    local sprite = self.parent:addChild(Sprite("effects/attack/cut_v", self.x, self.y))
    sprite.layer = self.layer + 0.1
    sprite:setScale(2)
    sprite:setOrigin(0.5, 0.5)
    sprite:play(1 / 30, false, function(spr) spr:remove() end)

    local fade = self.parent:addChild(FlashFade(self.sprite.texture, self.x, self.y))
    fade.layer = self.layer + 0.05
    fade:setScale(self:getScale())
    fade:setOrigin(self:getOrigin())
end

--- Plays sounds when this enemy is attacked.
function ClimbEnemy:playAttackSounds()
    Assets.playSound("swing", 0.4, 1.2)
    Assets.playSound("key_her", 0.3, 1.2)
end

return ClimbEnemy