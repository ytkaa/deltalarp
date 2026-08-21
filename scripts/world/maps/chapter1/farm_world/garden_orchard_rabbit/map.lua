local garden_orchard_rabbit, super = Class(Map)

function garden_orchard_rabbit:onExit()
    if Game:getFlag("jenga_tower_fell", 0) == 1 then
        Game:setFlag("jenga_tower_fell", 2)
    end

    Game:setFlag("#chapter1/farm_world/garden_orchard_rabbit#24:used_once", false)
end;

return garden_orchard_rabbit