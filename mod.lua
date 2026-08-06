function Mod:init()
    --Events
    Game:registerEvent("squeak", function(data)
        return Squeak(data.x, data.y, {data.width, data.height, data.polygon})
    end)
    Game:registerEvent("resetbell", function(data)
        return ResetBell(data.x, data.y)
    end)
    Game:registerEvent("mysterygate", function(data)
        return MysteryGate(data.x, data.y)
    end)
    Game:registerEvent("barndoor", function(data)
        return BarnDoor(data.x, data.y)
    end)
    Game:registerEvent("dirtflower", function(data)
        return DirtFlower(data.x, data.y, {data.width, data.height, data.polygon}, data.properties)
    end)
    Game:registerEvent("dirtflowertile", function(data)
        return DirtFlowerTile(data.x, data.y, {data.width, data.height, data.polygon}, data.properties)
    end)
    Game:registerEvent("bloomer", function(data)
        return Bloomer(data.x, data.y, data.properties)
    end)
    Game:registerEvent("bloomertrigger", function(data)
        return BloomerTrigger(data.x, data.y, {data.width, data.height, data.polygon}, data.properties)
    end)
    Game:registerEvent("bloomobe", function(data)
        return Bloomobe(data.x, data.y, data.properties)
    end)
    Game:registerEvent("bloomobeburstcontrol", function(data)
        return BloomobeBurstControl(data.x, data.y, data.properties)
    end)
    Game:registerEvent("bloomobeburst", function(data)
        return BloomobeBurst(data.x, data.y)
    end)

    --Annoying music bullshit
    Utils.merge(MUSIC_VOLUMES, {
        ["blizzard2"] = 1,
        ["cave"] = 1,
        ["class1"] = 1,
        ["class2"] = 1,
        ["farm_battle_wip_2"] = 1,
        ["field_jarona"] = 1,
        ["garden"] = 2,
        ["gardner1"] = 1,
        ["grace"] = 1,
        ["Her"] = 1,
        ["itahu_1"] = 1,
        ["last_show_wip_2"] = 1,
        ["me"] = 1,
        ["mus_sc_forget"] = 1,
        ["mus_sc_her_2"] = 1,
        ["mus_st_troubledingle"] = 1,
        ["petal_limiter"] = 1,
        ["petaler_wip_1"] = 1,
        ["pursuit1"] = 1,
        ["quasar"] = 3,
        ["racerb4"] = 1,
        ["rebattle4"] = 1,
        ["sanctum1"] = 1,
        ["start"] = 1,
        ["tentative boss"] = 1,
        ["the entrance"] = 1,
        ["themes and such7"] = 1,
        ["tofer"] = 1,
        ["versus_grace3"] = 1,
        ["whoot"] = 1,
    })

    print("LOADED " .. self.info.name .. " - THE START..!")
end
