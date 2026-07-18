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
        ["battle/idle"] = {"battle/idle", 1/6, true}
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