local actor, super = Class(Actor, "bluebunny")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Bluebunny"

    -- Width and height for this actor, used to determine its center
    self.width = 19
    self.height = 34

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 4, 22, 11, 12 }

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 0, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/chapter1/bluebunny"
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
        ["talk"] = 1/4
    }

    -- Table of sprite animations
    self.animations = {
        ["stool"] = {"stool", 1/3, true}
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

return actor
