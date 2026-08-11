local item, super = Class(Item, "dark_energy_ii")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Dark Energy II"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/magic"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Not for you"
    -- Menu description
    self.description = "..?"

    -- Default shop price (sell price is halved)
    self.price = 750
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
        attack = 5,
        defense = 0
    }
    -- Bonus name and icon (displayed in equip menu)
    --self.bonus_name = "Sweetness"
    --self.bonus_icon = "ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        --orbit = true
    }

    -- Character reactions
    self.reactions = {
        grace = "What the $$!$ even is this...",
        tofer = "Check it..?"
    }
end

--function item:convertToLightEquip(chara)
--    return "light/tubular_key"
--end

--function item:getAttackCritBoxSize(battler)
--    return 2
--end

return item
