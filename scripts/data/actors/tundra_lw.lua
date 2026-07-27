local actor, super = Class(Actor, "tundra_lw")

function actor:init()
    super.init(self)

    self.name = "Tundra"

    self.width = 37
    self.height = 49

    self.hitbox = {11, 34, 17, 15}

    self.soul_offset = {12.5, 24}

    self.color = {1, 0, 1}

    self.path = "party/tundra/light"
    self.default = "tundra"

    self.portrait_path = nil
    self.portait_offset = {-19, -13}

    self.can_blush = false

    self.voice = nil

    self.animations = {
        -- Movement animations
        --["walk"] = {"walk", 4/30, true},

        -- Battle animations
        --["battle/idle"] = {"battle/idle", 1/6, true}
    }

    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1}
    }

    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }
end

return actor