---@class ItemBox : Interactable
local ItemBox, super = Class(Interactable)

function ItemBox:init(x, y)
    super.init(self, x, y, {80, 80})
    self:setSprite("world/events/item_box")
    self.collectable = true
end

function ItemBox:onEnter(player)
    print("Its For You dawg. Its lit")
    if self.collectable == true then
        Game:setFlag("speedBoost", true)
        self.sprite.alpha = 0
        Assets.playSound("break1")
        Assets.playSound("boost")
        self.timer = Timer()
        self.timer:after(2, function()
            self.sprite.alpha = 1
            self.collectable = true
            Game:setFlag("speedBoost", false)
        end)
        self.collectable = false
    end
end

function ItemBox:update()
    if self.timer then
        self.timer:update()
    end
    super.update(self)
end

return ItemBox