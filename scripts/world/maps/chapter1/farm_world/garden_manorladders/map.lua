local garden_manorladders, super = Class(Map)

function garden_manorladders:onEnter()
    if Game:getFlag("carrying_dirt", false) then
        local dirtFlower = Sprite("tilesets/farm_world/garden/dirt_flower", 0, 0, 20, 20)
        Game.world.player:addChild(dirtFlower)
        dirtFlower:setPosition(dirtFlower.x, dirtFlower.y - 10)
    end
    if Game:getFlag("shovel_quest", 0) > 0 then
        Game:setFlag("shovel_lines", true)
        Game:addFlag("shovel_quest", 1)
    end
end;

return garden_manorladders