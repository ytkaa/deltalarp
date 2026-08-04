return function(event)
    Game.world.music:fade(0, 2, function() Game.world.music:stop() end)
end