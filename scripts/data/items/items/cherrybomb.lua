local item, super = Class(HealItem, "cherrybomb")

function item:init()
    super.init(self)

    -- Display name
    self.name = "CherryBomb"
    -- Name displayed when used in battle (optional)
    self.use_name = "CHERRY BOMB"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals team\n300 HP"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "Surprisingly good eats. Seems to be bursting with flavors. Heals 300HP to the team."

    -- Amount healed (HealItem variable)
    self.heal_amount = 300

    -- Default shop price (sell price is halved)
    self.price = 400
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        grace = "It's so... edible...",
        tofer = "Check it!",
    }
end

function item:getShopDescription()
    -- Don't automatically add item type
    return self.shop
end

return item