return {
    pickupRakeTreasure = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)") --needs a cutscene for each treasure unfortunately, trust me i tried making this easier
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpFoliageAssorter", true)
                Game:setFlag("FoliageAssorter", true)
                cutscene:text("* (Picked up treasure.)")
                if (not Game:getFlag("hasPickedUpTreasureBefore")) then
                    cutscene:text("* (The weight of the treasure pulls you down...)")
                    cutscene:text("* (You are now overencumbered and cannot run![wait:5] SPEED in overworld and battles [sound:awkward]reduced.)")
                    Game:setFlag("hasPickedUpTreasureBefore", true)
                else
                    return
                end
            else 
                return
            end
    end;
    pickupBugAnnihilator = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpBugAnnihilator", true)
                Game:setFlag("BugAnnihilator", true)
                --carriedTreasure = "BugAnnihilator" --I would`ve prefered to use a global variable, but global variables persist through ALL OF KRISTAL. How braindead is that
                cutscene:text("* (Picked up treasure.)")
                if (not Game:getFlag("hasPickedUpTreasureBefore")) then
                    cutscene:text("* (The weight of the treasure pulls you down...)")
                    cutscene:text("* (You are now overencumbered and cannot run![wait:5] SPEED in overworld and battles [sound:awkward]reduced.)")
                    Game:setFlag("hasPickedUpTreasureBefore", true)
                else
                    return
                end
            else 
                return
            end
    end;
    evaluateCaveTreasure = function(cutscene, event) --https://preview.redd.it/weird-yandere-simulator-fact-if-else-v0-99l916y0sgpd1.png?width=513&format=png&auto=webp&s=960f031402041549cc472cdce42820ee48c372e6
        if Game:getFlag("FoliageAssorter") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Foliage Assorter.[wait:5] It's worth [sound:treasureappraise]D$20.)")
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("FoliageAssorter", false)
    elseif Game:getFlag("BugAnnihilator") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Bug Annihilator.[wait:5] It's worth [sound:treasureappraise]D$30.)")
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("BugAnnihilator", false)
        else
            cutscene:text("* (Time is money.[wait:5] Don't waste my time!)")
        end
    end;
    cave_entrance = function(cutscene, event)
        local outer = Component(FixedSizing(665, 420)) -- The root should be a fixed size.
        outer:setLayout(VerticalLayout({ gap = 0, align = "center" })) -- Center it vertically!
        outer.parallax_x = 0
        outer.parallax_y = 0
        local inner = Component(FillSizing(), FitSizing()) -- Stretch horizontally, fit to content vertically
            inner:setLayout(HorizontalLayout({ gap = 0, align = "center" })) -- Center it horizontally!
            -- anything we add to inner will be centered horizontally
            local box = BoxComponent(FitSizing()) --this box changes to fit the contents
            box:setOrigin(0.0195, 0) --Bro
                local menu = EasingSoulMenuComponent(FitSizing())
                    local caveText = Text("Flower Den")
                    local caveDesc = Text("Enter this hole with your current equipment?")
                    caveText:setOrigin(-0.31, 0) -- you cannot natively center text
                    caveDesc:setOrigin(0.02, 0)
                    menu:addChild(caveText)
                    menu:addChild(caveDesc)
                    menu:setLayout(VerticalLayout({ gap = 0, align = "start" }))
                    local optionYes = Text("Yes")
                    local optionNo = Text("No")
                    optionYes:setOrigin(-0.38, 0)
                    optionNo:setOrigin(-0.39, 0)
                    menu:addChild(SoulMenuItemComponent(optionYes, function()
                        Game.world:closeMenu(outer)
                        outer:remove()
                        Game.world:startCutscene(function(cutscene, event) --this somehow works
                            Game:setFlag("inSublevel1") --grr no global variables allowed, check other note for why
                            cutscene:wait(cutscene:fadeOut(0.5))
                            Game.world:loadMap("chapter1/null_room_for_cutscenes", "spawn")
                            Assets.playSound("flee")
                            cutscene:fadeIn(0.1)
                            cutscene:wait(2)
                            Assets.playSound("cavesave", 1.5)
                            cutscene:wait(3.25)
                            local caveSaveWarning = Sprite("deltalarp/cavesave1", 50, 100)
                            Game.world:addChild(caveSaveWarning)
                            cutscene:wait(1.5)
                            caveSaveWarning:setSprite("deltalarp/cavesave2")
                            caveSaveWarning:update()
                            cutscene:wait(1.5)
                            caveSaveWarning:remove()
                            cutscene:wait(1.5)
                            Assets.playSound("closet_fall", 0.75)
                            cutscene:wait(3)
                            cutscene:wait(cutscene:fadeOut(0.1))
                            Assets.playSound("closet_impact")
                            Game.world:loadMap("chapter1/farm_world/flowerden", "spawn")
                            Kristal.saveGame()
                            cutscene:wait(cutscene:fadeIn(0.5))
                        end)
                    end))
                    menu:addChild(SoulMenuItemComponent(optionNo, function() Game.world:closeMenu(outer) outer:remove()  end))
                    menu.soul_offset_x = 215 -- this is just disgusting
                    menu:setFocused()
                box:addChild(menu)
            inner:addChild(box)
        outer:addChild(inner) -- Add the inner component to the outer component!
        --Game.stage:addChild(outer) -- this works way better and doesnt need jank, but player can still move, despite the fact that i nested this in a cutscene
        Game.world:openMenu(outer)
        Assets.playSound("pik2menuopen")
    end;
    cave_continue = function(cutscene, event)
        local outer = Component(FixedSizing(665, 420)) -- The root should be a fixed size.
        outer:setLayout(VerticalLayout({ gap = 0, align = "center" })) -- Center it vertically!
        outer.parallax_x = 0
        outer.parallax_y = 0
        local inner = Component(FillSizing(), FitSizing()) -- Stretch horizontally, fit to content vertically
            inner:setLayout(HorizontalLayout({ gap = 0, align = "center" })) -- Center it horizontally!
            -- anything we add to inner will be centered horizontally
            local box = BoxComponent(FitSizing()) --this box changes to fit the contents
            box:setOrigin(0.0195, 0) --Bro
                local menu = EasingSoulMenuComponent(FitSizing())
                    local caveDesc = Text("Delve deeper into the cave?")
                    caveDesc:setOrigin(0.02, 0)
                    menu:addChild(caveDesc)
                    menu:setLayout(VerticalLayout({ gap = 0, align = "start" }))
                    local optionYes = Text("Yes")
                    local optionNo = Text("No")
                    optionYes:setOrigin(-0.21, 0)
                    optionNo:setOrigin(-0.22, 0)
                    menu:addChild(SoulMenuItemComponent(optionYes, function()
                        Game.world:closeMenu(outer)
                        outer:remove()
                        Game.world:startCutscene(function(cutscene, event) --this somehow works
                            cutscene:wait(cutscene:fadeOut(0.5))
                            Game.world:loadMap("chapter1/null_room_for_cutscenes", "spawn")
                            Assets.playSound("flee")
                            cutscene:fadeIn(0.1)
                            cutscene:wait(2)
                            Assets.playSound("cavesave", 1.5)
                            cutscene:wait(3.25)
                            local caveSaveWarning = Sprite("deltalarp/cavesave1", 50, 100)
                            Game.world:addChild(caveSaveWarning)
                            cutscene:wait(1.5)
                            caveSaveWarning:setSprite("deltalarp/cavesave2")
                            caveSaveWarning:update()
                            cutscene:wait(1.5)
                            caveSaveWarning:remove()
                            cutscene:wait(1.5)
                            Assets.playSound("closet_fall", 0.75)
                            cutscene:wait(3)
                            cutscene:wait(cutscene:fadeOut(0.1))
                            Assets.playSound("closet_impact")
                            if Game:getFlag("inSublevel4") then
                                Game.world:loadMap("chapter1/farm_world/flowerden", "spawn")
                                Game:setFlag("inSublevel5")
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel3") then
                                Game.world:loadMap("chapter1/farm_world/flowerden", "spawn")
                                Game:setFlag("inSublevel4")
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel2") then
                                Game.world:loadMap("chapter1/farm_world/flowerden", "spawn")
                                Game:setFlag("inSublevel3")
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel1") then
                                Game.world:loadMap("chapter1/farm_world/flowerden", "spawn")
                                Game:setFlag("inSublevel2")
                                Kristal.saveGame()
                            end
                            cutscene:wait(cutscene:fadeIn(0.5))
                        end)
                    end))
                    menu:addChild(SoulMenuItemComponent(optionNo, function() Game.world:closeMenu(outer) outer:remove()  end))
                    menu.soul_offset_x = 110 -- this is just disgusting
                    menu:setFocused()
                box:addChild(menu)
            inner:addChild(box)
        outer:addChild(inner) -- Add the inner component to the outer component!
        --Game.stage:addChild(outer) -- this works way better and doesnt need jank, but player can still move, despite the fact that i nested this in a cutscene
        Game.world:openMenu(outer)
        Assets.playSound("pik2menuopen")
    end;
}