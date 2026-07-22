local item, super = Class(LightEquipItem, "light/key")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Key"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "A key without a label. It's useless."

    -- Light world check text
    self.check = "[wait:5]A key without a label.[wait:5] It's useless."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Default dark item conversion for this item
    self.dark_item = "key"
end;

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        Assets.playSound("egg")
    end)
end

function item:onToss()
    Game.world:startCutscene(function(cutscene)
        Game.world:showText("* (It stuck to Vess and wouldn't let go...)")
    end)
    return false
end

return item
