local Zobate, super = Class(Actor, "zobate_shop")

function Zobate:init()
    super.init(self)

    -- The name of the actor
    self.name = "Zobate"

    -- The sprites dimensions
    -- The shop uses this to know where to place the shopkeeper
    self.width = 135
    self.height = 109

    -- The path to the shopkeeper sprites
    self.path = "shopkeepers/zobate"
    -- The default animation to use
    self.default = "talk"

    self.talk_sprites = {
        ["talk"] = 8/30,
        ["oh"] = 8/30,
        ["oh_sad"] = 8/30,
        ["idle"] = 8/30,
        ["slight_smile"] = 8/30,
        ["smile"] = 8/30,
        ["bitter"] = 8/30,
    }
end

return Zobate