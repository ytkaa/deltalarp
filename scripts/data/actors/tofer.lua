local actor, super = Class(Actor, "tofer")

function actor:init()
    super.init(self)

    self.name = "Tofer"

    self.width = 27
    self.height = 56

    self.hitbox = {4, 42, 19, 14}

    self.soul_offset = {12.5, 24}

    self.color = {1, 0, 1}

    self.path = "party/tofer"
    self.default = "cycle"

    self.portrait_path = "face/tofer"
    self.portait_offset = {-19, -13}

    self.can_blush = false

    self.voice = "tofer"

    self.animations = {
        -- Movement animations
        ["cycle"] = {"cycle", 8/30, true},
    }

    self.offsets = {
        
    }

    self.mirror_sprites = {
        
    }
end

return actor