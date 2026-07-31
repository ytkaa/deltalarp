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
        ["move"] = {"move", 1/2, true},
        ["want"] = {"want", 1/2, true},
    }

    self.talk_sprites = {
    }

    self.offsets = {
        
    }

    self.mirror_sprites = {
        
    }

    self.high_pitch = false

end

function actor:onTextSound(current_node, state)
    if self.high_pitch then
        Assets.playSound("voice/sofer", 1, 1)
    else
        Assets.playSound("voice/sofer", 1, 0.9)
    end
    
    return true
end

return actor