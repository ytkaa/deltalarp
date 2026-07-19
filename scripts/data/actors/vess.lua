local actor, super = Class(Actor, "vess")

function actor:init()
    super.init(self)

    self.name = "Vess"

    self.width = 19
    self.height = 37

    self.hitbox = {0, 25, 19, 14}

    self.soul_offset = {10, 24}

    self.color = {1, 0, 1}

    self.path = "party/vess"
    self.default = "walk"

    self.voice = nil
    self.portrait_path = nil
    self.portait_offset = nil

    self.can_blush = false

    self.animations = {
        -- Movement animations
        --["walk"] = {"walk", 4/30, true},

        -- Battle animations
        ["battle/idle"] = {"battle/idle", 1/6, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        --["battle/act"]          = {"battle/act", 1/15, false},
        --["battle/spell"]        = {"battle/act", 1/15, false},
        --["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        --["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        --["battle/act_ready"]    = {"battle/actready", 0.2, true},
        --["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        --["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        --["battle/defend_ready"] = {"battle/defend", 1/15, false},
    }

    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1},

        ["battle/attack"] = {-8, -6},
        ["battle/attackready"] = {-8, -6},
        --["battle/act"] = {-6, -6},
        --["battle/actend"] = {-6, -6},
        --["battle/actready"] = {-6, -6},
        --["battle/item"] = {-6, -6},
        --["battle/itemready"] = {-6, -6},
        --["battle/defend"] = {-5, -3},
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }
end

return actor