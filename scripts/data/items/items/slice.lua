local item, super = Class(HealItem, "slice")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Slice"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n45 HP"
    -- Shop description
    self.shop = "Imitation\napple\nHeals 45HP"
    -- Menu description
    self.description = "A hearty slice of something shamefully masquerading as an apple. +45HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 45

    -- Default shop price (sell price is halved)
    self.price = 175
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
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
        grace = "This is just an apple slice..?",
        tofer = "Check it!",
    }
end

function item:getShopDescription()
    -- Don't automatically add item type
    return self.shop
end

return item