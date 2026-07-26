function Mod:init()
    Game:registerEvent("squeak", function(data)
        return Squeak(data.x, data.y, {data.width, data.height, data.polygon})
    end)
    Game:registerEvent("resetbell", function(data)
        return ResetBell(data.x, data.y)
    end)
    print("Loaded " .. self.info.name .. " - THE START!")
end
