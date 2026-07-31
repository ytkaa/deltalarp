local item, super = Class(Item, "unicycle")

function item:init()
    super.init(self)

    -- Display name
    self.name = "UniCycle"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/cycle"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "The world-famous unicycle"

    -- Default shop price (sell price is halved)
    self.price = 300
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 1,
        defense = 0
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "The Coolest"
    self.bonus_icon = "ui/menu/icon/demon"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        tofer = true
    }

    -- Character reactions
    self.reactions = {
        grace = "No.",
        tofer = "Check it!"
    }
end

--function item:getAttackCritBoxSize(battler)
--    return 2
--end

return item
