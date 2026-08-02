local garden_manorladders, super = Class(Map)

function garden_manorladders:onEnter()
    if Game:getFlag("carrying_dirt", false) then
        local dirtFlower = Sprite("tilesets/farm_world/garden/dirt_flower", 0, 0, 20, 20)
        Game.world.player:addChild(dirtFlower)
        dirtFlower:setPosition(dirtFlower.x, dirtFlower.y - 10)
    end
end;

return garden_manorladders