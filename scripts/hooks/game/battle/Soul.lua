local Soul, super = HookSystem.hookScript(Soul)

function Soul:init(x, y, color)
    super.init(self, x, y, color)

    if Game:getFlag("isCarryingTreasure") then
        self.speed = 3
    end
end

return Soul