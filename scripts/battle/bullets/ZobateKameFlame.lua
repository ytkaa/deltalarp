local ZobateKameFlame, super = Class(Bullet)

function ZobateKameFlame:init(x, y, dir)
    super.init(self, x, y, "bullets/zobate/kame_flame")
    
    self.element = "entertainment"

    self.destroy_on_hit = true

    self:setOrigin(0.5)
    self.sprite:play(1/4, true)

    self.physics.speed = 5

    self.physics.direction = dir

    self.collider = CircleCollider(self, self.width/2, self.height/2, self.width/2 - 3.5)

    self.damage = 30
    
    if Game.battle.arena then
        self:setParent(Game.battle.arena.mask)
    else
        self:remove()
    end
end

function ZobateKameFlame:update()
    super.update(self)
end

return ZobateKameFlame