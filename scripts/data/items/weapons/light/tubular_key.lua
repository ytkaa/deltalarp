local item, super = Class(LightEquipItem, "light/tubular_key")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Tubular Key"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "A tubular key."

    -- Light world check text
    self.check = "3 AT\n* It's a tubular key."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 3,
        defense = 0
    }

    -- Default dark item conversion for this item
    self.dark_item = "tubular_key"
end

return item
