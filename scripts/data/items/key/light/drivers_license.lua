local item, super = Class(LightEquipItem, "light/drivers_license")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Driver's License"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "No one would believe you could drive if you didn't carry this."

    -- Light world check text
    self.check = "\n[wait:5]No one would believe you could drive if you didn't carry this."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Default dark item conversion for this item
    self.dark_item = "drivers_license"
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

function item:onToss()
    Game.world:startCutscene(function(cutscene)
        Game.world:showText("* (You thought twice about throwing yourself away.)")
    end)
    return false
end

return item
