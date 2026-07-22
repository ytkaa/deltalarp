local intro, super = Class(Map)

function intro:onEnter()
    Game:setFlag("chapter", 1)
    Game.world:startCutscene("chapter1/intro", "intro")
end;

function intro:onExit()

end;

return intro