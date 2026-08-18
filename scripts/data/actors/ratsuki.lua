local actor, super = Class(Actor, "ratsuki")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Ratsuki"

    -- Width and height for this actor, used to determine its center
    self.width = 26
    self.height = 49

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 3, 40, 20, 10 }

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 0, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/ruraltown/ratsuki"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "talk"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {
        ["talk"] = 1/6
    }

    -- Table of sprite animations
    self.animations = {
        ["talk_angry"] = 1/7
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

return actor
