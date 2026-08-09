---@class MysteryGate : Interactable
local MysteryGate, super = Class(Interactable)

function MysteryGate:init(x, y, properties)
    super.init(self, x, y, {80, 80}, properties)
    self:setSprite("world/events/gate2")
    self.solid = true

    self.key = properties["key"] or "mystery"
end

function MysteryGate:onInteract(player, dir)
    if self.key == "mystery" then
        self.world:startCutscene("chapter1/zobate", "mystery_gate", self)
    end
end

return MysteryGate