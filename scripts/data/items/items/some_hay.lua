local item, super = Class(Item, "some_hay")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Some Hay"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Hurts\n10 HP"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "You can't digest this. -10HP"

    -- Amount healed (HealItem variable)
    --self.heal_amount = -10
    self.poison_amount = 10

    -- Default shop price (sell price is halved)
    self.price = 175
    -- Whether the item can be sold
    self.can_sell = false

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
        grace = "I'm not eating $$$$ing hay.",
        tofer = "Check it!",
    }
end

function item:getShopDescription()
    -- Don't automatically add item type
    return self.shop
end

function item:onWorldUse(target)
    if target.id == "grace" then
        Assets.playSound("ui_cant_select")
        return false
    end

    target:setHealth(math.max(1, target:getHealth() - self.poison_amount))
    Assets.playSound("hurt")
    return true
end

function item:onBattleUse(user, target)
    Game.battle:hurt(10, true, user)
    Assets.playSound("hurt")
    return true
end

return item