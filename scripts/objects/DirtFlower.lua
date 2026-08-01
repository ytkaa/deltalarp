---@class DirtFlower : Event
local DirtFlower, super = Class(Interactable)

function DirtFlower:init(x, y, properties)
    super.init(self, x, y, nil, properties)
    self:setSprite("tilesets/farm_world/garden/dirt_flower")
    self.solid = true
    self.once = true
end

function DirtFlower:onInteract(player, dir)
    if Game:getFlag("carrying_dirt", false) then
        Game.world:showText("* (You're carrying too much dirt!)")
    else
        local dirtFlower = Sprite("tilesets/farm_world/garden/dirt_flower", 0, 0, 20, 20)
        player:addChild(dirtFlower)
        dirtFlower:setPosition(dirtFlower.x, dirtFlower.y - 10)
        Assets.playSound("item")
        Game:setFlag("carrying_dirt", true)
        self:remove()
    end

    super.onInteract(self, player, dir)
    self:remove()
    return true
end

return DirtFlower