local farm6, super = Class(Map)

function farm6:onEnter()
    if Game:getFlag("seen_grace_couch", false) == false then
        Game.world:startCutscene("chapter1/farm_world", "grace_couch")
    end
    Game:setFlag("seen_grace_couch", true)
end;

return farm6