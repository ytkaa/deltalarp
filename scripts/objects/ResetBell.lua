---@class ResetBell : Event
local ResetBell, super = Class(Event)

function ResetBell:init(x, y)
    super.init(self, x, y, 40, 40)
    self:setSprite("world/events/bell")
    self.solid = true
end

function ResetBell:onInteract(player, dir)
    Assets.playSound("awkward")

    --The following code is completely snatched from the wiki

    -- Get every PushBlock in the current scene and reset it
    for _, pushblock in ipairs(Game.stage:getObjects(PushBlock)) do
        pushblock:reset()
    end
    -- Prevets the player for moving while the block are resetting,
    -- if you don't do this, the player
    -- can step where the block are supposed to go and get stuck
    -- in the collision.
    Game.lock_movement = true
    Game.world.timer:after(.4, function ()
        Game.lock_movement = false
    end)
end

return ResetBell