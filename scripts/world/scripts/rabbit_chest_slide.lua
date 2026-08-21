return function(event, player)
    Assets.playSound("dtrans_square")
    local chest = Game.world:getEvent(17)
    chest:slideTo(360, 240, 0.9, "out-bounce")
end