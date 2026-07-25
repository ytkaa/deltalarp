local actor, super = Class(Actor, "gardner")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "GARDNER"

    -- Width and height for this actor, used to determine its center
    self.width = 38
    self.height = 66

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 0, 52, 38, 14 }

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 1, 0, 0 }

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "bosses/gardner"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = "gardner"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/gardner"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = { -25, -12 }

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {
        
    }

    -- Table of sprite animations
    self.animations = {
        -- Looping animation with 0.35 seconds between each frame
        -- (even though there's only 1 idle frame)
        ["idle"] = { "idle", 0.35, true },
        ["smug"] = { "smug", 0.35, true },
        ["annoyed"] = { "annoyed", 0.35, true },
        ["threat_pink"] = { "threat_pink", 0.35, true },
        ["neutral"] = { "neutral", 0.35, true },
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Since the width and height is the idle sprite size, the offset is 0,0
        ["idle"] = { 0, 0 },
        ["smug"] = { 0, 0 },
        ["annoyed"] = { 0, 0 },
        ["threat_pink"] = { 0, 0 },
        ["neutral"] = { 0, 0 },
    }
end

return actor
