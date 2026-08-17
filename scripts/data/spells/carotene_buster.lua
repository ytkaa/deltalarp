local spell, super = Class(Spell, "carotene_buster")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "CaroteneBuster"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Damage over time"
    -- Menu description
    self.description = "Deal minor damage each turn. With Carrot!"

    -- TP cost
    self.cost = 25

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"spare_tired"}
end

function spell:getTPCost(chara)
    if chara:checkWeapon("blueshoes") then
        return 0
    end

    return super.getTPCost(self, chara)
end

function spell:getCastMessage(user, target)
    local message = super.getCastMessage(self, user, target)
    return message.."\n[wait:0.25s]* The enemy takes damage for the next 2 turns."
end

function spell:onCast(user, target)
    local function createParticle(x, y)
        local sprite = Sprite("effects/icespell/snowflake", x, y)
        sprite:setOrigin(0.5, 0.5)
        sprite:setScale(1.5)
        sprite.layer = BATTLE_LAYERS["above_battlers"]
        Game.battle:addChild(sprite)
        return sprite
    end

    local x, y = target:getRelativePos(target.width/2, target.height/2, Game.battle)

    local particles = {}
    Game.battle.timer:script(function(wait)
        wait(1/30)
        Assets.playSound("tofer_checkit")
        particles[1] = createParticle(x-25, y-20)
        wait(3/30)
        particles[2] = createParticle(x+25, y-20)
        wait(3/30)
        particles[3] = createParticle(x, y+20)
        wait(3/30)
        Game.battle:addChild(IceSpellBurst(x, y))
        for _,particle in ipairs(particles) do
            for i = 0, 5 do
                local effect = IceSpellEffect(particle.x, particle.y)
                effect:setScale(0.75)
                effect.physics.direction = math.rad(60 * i)
                effect.physics.speed = 8
                effect.physics.friction = 0.2
                effect.layer = BATTLE_LAYERS["above_battlers"] - 1
                Game.battle:addChild(effect)
            end
        end
        wait(1/30)
        for _,particle in ipairs(particles) do
            particle:remove()
        end
        wait(4/30)

        local damage = self:getDamage(user, target)
        target:hurt(damage, user, function() end)
        target.toferDoT = 2

        Game.battle:finishActionBy(user)
    end)

    return false
end

function spell:getDamage(user, target)
    return math.ceil(MathUtils.random(10, 13))
end

return spell