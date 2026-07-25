return function(event, player, facing)
    if Game:getFlag("gardner_chase_death") == true then
        Game.world:startCutscene("chapter1/farm_world", "gardner_chase_short")
    else
        Game.world:startCutscene("chapter1/farm_world", "gardner_chase")
    end
end