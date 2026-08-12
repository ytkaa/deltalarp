local TreasureChest, super = HookSystem.hookScript(TreasureChest)

--- Handles opening the chest and giving the player their items
function TreasureChest:onInteract(player, dir)
    if self:getFlag("opened") then
        self.world:showText("* (The chest is empty.)")
    else
        Assets.playSound("locker")
        self.sprite:setFrame(2)
        self:setFlag("opened", true)

        local name, success, result_text
        if self.item then
            local item = self.item
            if type(self.item) == "string" then
                item = Registry.createItem(self.item)
            end
            success, result_text = Game.inventory:tryGiveItem(item)
            name = item:getName()
        elseif self.money then
            name = self.money.." "..Game:getConfig("darkCurrency")
            success = true
            result_text = "* ([color:yellow]"..name.."[color:reset] was added to your [color:yellow]DARK WALLET[color:reset].)"
            Game.money = Game.money + self.money
        end

        if name then
            self.world:showText({
                "* (You opened the treasure\nchest.)[wait:5]\n* (Inside was [color:yellow]"..name.."[color:reset].)",
                result_text
            }, function()
                if not success then
                    self.sprite:setFrame(1)
                    self:setFlag("opened", false)
                end
            end)
        else
            self.world:showText("* (The chest is empty.)")
            success = true
        end

        if success and self.set_flag then
            Game:setFlag(self.set_flag, (self.set_value == nil and true) or self.set_value)
        end
    end

    return true
end

return TreasureChest