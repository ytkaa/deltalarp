local FleecebugDrag, super = Class(Wave)

function FleecebugDrag:init()
    super.init(self)
end

function FleecebugDrag:onStart()
    for i = 1, 8 do
        local bullet = self:spawnBullet("fleecebug", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        bullet:setScale(0.75)
    end
end

function FleecebugDrag:update()
    super.update(self)
end

return FleecebugDrag
