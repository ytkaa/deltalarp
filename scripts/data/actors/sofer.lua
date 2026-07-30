local actor, super = Class(Actor, "sofer")

function actor:init()
    super.init(self)

    self.name = "Sofer"

    self.width = 27
    self.height = 46

    self.hitbox = {0, 32, 25, 14}

    self.soul_offset = {12.5, 24}

    self.color = {1, 0, 1}

    self.path = "party/sofer"
    self.default = "move"

    self.portrait_path = nil
    self.portait_offset = {-19, -13}

    self.can_blush = false

    self.voice = "sofer"

    self.animations = {
        -- Movement animations
        ["move"] = {"move", 1/2, true},
    }

    self.talk_sprites = {
        ["talk"] = 1/2
    }

    self.offsets = {
        
    }

    self.mirror_sprites = {
        
    }
end

return actor