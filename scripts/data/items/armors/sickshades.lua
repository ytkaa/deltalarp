local item, super = Class(Item, "sickshades")

function item:init()
    super.init(self)

    -- Display name
    self.name = "SickShades"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/specs"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Sick-ass shades"

    -- Default shop price (sell price is halved)
    self.price = 400
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
        attack = 0,
        defense = 1,
        magic = 1,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Sickness UP"
    self.bonus_icon = "ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions
    self.reactions = {
        grace = "No.",
        tofer = "Check it!"
    }
end

return item
