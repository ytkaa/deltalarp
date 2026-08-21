local garden_orchard_rabbit, super = Class(Map)

function garden_orchard_rabbit:onExit()
    if Game:getFlag("jenga_tower_fell", 0) then
        Game:setFlag("jenga_tower_fell", 2)
    end
end;

return garden_orchard_rabbit