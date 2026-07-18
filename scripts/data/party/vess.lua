local character, super = Class(PartyMember, "vess")

function character:init()
    super.init(self)

    self.name = "Vess"

    self:setActor("vess")
    self:setLightActor("vess")

    self.level = 1
    self.title = "Vessel\nLost."

    self.soul_priority = 5
    self.soul_color = {1, 0.4, 0.84}

    self.has_act = true
    self.has_spells = false

    self.has_xact = false
    --self.xact_name = "V-Action"

    self.health = 50

    self.stats = {
        health = 50,
        attack = 3,
        defense = 1,
        magic = 0
    }

    self.max_stats = {
        health = 120
    }

    self.weapon_icon = "ui/menu/equip/sword"

    self:setWeapon("car_keys")
    --self:setArmor(1, "amber_card")
    --self:setArmor(2, "amber_card")

    self.lw_armor_default = "light/bandage"
    self.lw_weapon_default = "light/car_keys"

    -- Character color (for action box outline and hp bar)
    self.color = {0.33, 0.03, 0.48}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.5, 0.18, 0.48}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0.5, 0.18, 0.48}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0.5, 0.18, 0.48}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.5, 0.18, 0.48}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/vess/head"
    -- Path to head icons used in battle
    self.head_icons = "party/vess/icon"
    -- Name sprite
    self.name_sprite = "party/vess/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "bomb"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

return character