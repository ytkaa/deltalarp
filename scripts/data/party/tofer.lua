local character, super = Class(PartyMember, "tofer")

function character:init()
    super.init(self)

    self.name = "Tofer"
    self.pronoun = "his"

    self:setActor("tofer")

    self.level = Game.chapter
    self.title = "Carrot\nCheck it!"

    self.soul_priority = 1
    self.soul_color = {1, 0.4, 0.84}

    self.has_act = false
    self.has_spells = true
    self:addSpell("bed_carotene")
    self:addSpell("carotene_buster")

    self.has_xact = true
    self.xact_name = "T-Action"

    self.health = 90

    self.stats = { -- 3ATK 3DEF 3MAG when counting armor.
        health = 90,
        attack = 3,
        defense = 2,
        magic = 3
    }

    self.max_stats = {
        health = 110
    }

    self.weapon_icon = "ui/menu/equip/cycle"

    self:setWeapon("unicycle")
    self:setArmor(1, "sickshades")
    self:setArmor(2, "the_pods")

    --self.lw_armor_default = "light/bandage"
    --self.lw_weapon_default = "light/car_keys"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 0.5, 0.25}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {1, 0.5, 0.25}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {1, 0.5, 0.25}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {1, 0.5, 0.25}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 0.5, 0.25}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/tofer/head"
    -- Path to head icons used in battle
    self.head_icons = "party/grace/icon"
    -- Name sprite
    self.name_sprite = "party/vess/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/slap_t"
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
    self.gameover_message = { "Check it![sound:tofer_checkit]" }
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

--The following two functions are stolen from Susie and they prevent taking equipment from the party member.
-- Never mind, actually. I replaced all of the Susan code
function character:canEquip(item, slot_type, slot_index)
    return false;
end

function character:getReaction(item, user)
    if user.id ~= self.id then --We have to account for equipping anyone who isn't Tofer.
        return super.getReaction(self, item, user)
    elseif item then
        if item.type == "key" or item.type == "item" then
            if item.type == "item" then Assets.playSound("tofer_checkit") end
            return super.getReaction(self, item, user)
        else
            Assets.playSound("tofer_checkit")
            return "Check it!"
        end
    else
        Assets.playSound("tofer_checkit")
        return "Check it!"
    end
end

function character:onAttackHit(enemy, damage)
    local tofer = Game.battle:getPartyBattler("tofer")
    local inital_x = tofer.x
    local inital_y = tofer.y

    -- Tofer runs over the enemy with the Cycle
    tofer:slideTo(enemy.x + 40, enemy.y, 0.2)
    Game.battle.timer:after(0.2, function()
    tofer:slideTo(enemy.x - 40, enemy.y, 0.1)
    end)
    Game.battle.timer:after(0.3, function()
    tofer:slideTo(enemy.x + 40, enemy.y, 0.1)
    end)
    Game.battle.timer:after(0.4, function()
    tofer:slideTo(enemy.x - 40, enemy.y, 0.1)
    end)
    Game.battle.timer:after(0.5, function()
        tofer:slideTo(inital_x, inital_y, 0.2)
    end)
end

return character