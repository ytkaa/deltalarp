local intro, super = Class(Map)

function intro:onEnter()
    Game:setFlag("chapter", 1)
    --local seen_intro = Game:getFlag("seen_intro")
    --print(seen_intro) -- Trash and obsolete
    Game.world:startCutscene("chapter1/intro", "intro")
    
end;

function intro:onExit()

end;

return intro