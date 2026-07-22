local item, super = Class(Item, "drivers_license")

function item:init()
    super.init(self)

    -- Display name
    self.name = "License"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "key"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "No one would believe you could drive if you didn't carry this."

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
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
    self.reactions = {}

    self.lightItem = "light/drivers_license"
end

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        local driverslicense = Sprite("party/vess/drivers_licensesmall")
        driverslicense:setOrigin(0.5, 0.5)
        driverslicense:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        Game.stage:addChild(driverslicense)
        driverslicense.layer = WORLD_LAYERS["ui"] or 100000
        Assets.playSound("egg")
        cutscene:wait(1/30)
        cutscene:wait(function()
            return Input.pressed("confirm")
        end)
        Game.stage:removeChild(driverslicense)
    end)
end

function item:convertToLight(inventory)
    return "light/drivers_license"
end



return item
