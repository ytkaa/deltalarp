return {
    pickupRakeTreasure = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)") --needs a cutscene for each treasure unfortunately, trust me i tried making this easier
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("soil_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
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
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupBugAnnihilator = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("soil_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
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
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupArmoredNut = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("soil_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpArmoredNut", true)
                Game:setFlag("ArmoredNut", true)
                cutscene:text("* (Picked up treasure.)")
                if (not Game:getFlag("hasPickedUpTreasureBefore")) then
                    cutscene:text("* (The weight of the treasure pulls you down...)")
                    cutscene:text("* (You are now overencumbered and cannot run![wait:5] SPEED in overworld and battles [sound:awkward]reduced.)")
                    Game:setFlag("hasPickedUpTreasureBefore", true)
                else
                    return
                end
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupArmoredNut2 = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("soil_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpArmoredNut2", true)
                Game:setFlag("ArmoredNut", true)
                cutscene:text("* (Picked up treasure.)")
                if (not Game:getFlag("hasPickedUpTreasureBefore")) then
                    cutscene:text("* (The weight of the treasure pulls you down...)")
                    cutscene:text("* (You are now overencumbered and cannot run![wait:5] SPEED in overworld and battles [sound:awkward]reduced.)")
                    Game:setFlag("hasPickedUpTreasureBefore", true)
                else
                    return
                end
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupRedPikmin = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("soil_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpRedPikmin", true)
                Game:setFlag("RedPikmin", true)
                cutscene:text("* (Picked up treasure.)")
                if (not Game:getFlag("hasPickedUpTreasureBefore")) then
                    cutscene:text("* (The weight of the treasure pulls you down...)")
                    cutscene:text("* (You are now overencumbered and cannot run![wait:5] SPEED in overworld and battles [sound:awkward]reduced.)")
                    Game:setFlag("hasPickedUpTreasureBefore", true)
                else
                    return
                end
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupBrokenHome = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("grass_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpBrokenHome", true)
                Game:setFlag("BrokenHome", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupHolyNectar = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("grass_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpHolyNectar", true)
                Game:setFlag("HolyNectar", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupColoredFrontiers = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("tile_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpColoredFrontiers", true)
                Game:setFlag("ColoredFrontiers", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupRubberUgly = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("tile_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpRubberUgly", true)
                Game:setFlag("RubberUgly", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupAdamantineGirdle = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                local current_time = Game.world.music:tell()
                Game.world.music:fade(0, 0.1)
                Game.music:play("metal_treasure", 0)
                Game.music:seek(current_time)
                Game.music:fade(1, 0.1)
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpAdamantineGirdle", true)
                Game:setFlag("AdamantineGirdle", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    pickupTheKey = function(cutscene, event)
        cutscene:text("[sound:treasure]* (You've found a treasure![wait:5] Pick it up?)")
        local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 and (not Game:getFlag("isCarryingTreasure")) then
                Game:setFlag("isCarryingTreasure", true)
                Game:setFlag("pickedUpTheKey", true)
                Game:setFlag("TheKey", true)
                cutscene:text("* (Picked up treasure.)")
            elseif Game:getFlag("isCarryingTreasure") then
                cutscene:text("* (Alas,[wait:5] picking up 2 treasures at a time is a feat not possible for a human.)")
            else
                return
            end
    end;
    evaluateCaveTreasure = function(cutscene, event) --https://preview.redd.it/weird-yandere-simulator-fact-if-else-v0-99l916y0sgpd1.png?width=513&format=png&auto=webp&s=960f031402041549cc472cdce42820ee48c372e6
        local treasuresCollected = treasuresCollected
        if Game:getFlag("FoliageAssorter") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Foliage Assorter.[wait:5] It's worth [sound:treasureappraise]D$45.)")
            local current_time = Game.music:tell()
            Game.music:stop()
            Game.music:fade(0, 0.5)
            Game.music:play("soil_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("FoliageAssorter", false)
            local count = Game:getFlag("treasuresCollected", 0) --Somehow, this works. 0 clue jesus christ
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("BugAnnihilator") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Bug Annihilator.[wait:5] It's worth [sound:treasureappraise]D$50.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("soil_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("BugAnnihilator", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("ArmoredNut") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Armored Nut.[wait:5] It's worth [sound:treasureappraise]D$35.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("soil_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("ArmoredNut", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("RedPikmin") then
            local auto = {
                ["auto"] = true
            }
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the ", auto)
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("soil_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            cutscene:text("* (Eww ew ew what the $$$$ is that)")
            cutscene:text("* (Dude it looks like a skinwalker version of me that's gross as $#!!)")
            cutscene:text("* (It's worth like [sound:treasureappraise]D$1 i dunno if anyone will even take that)")
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("RedPikmin", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("BrokenHome") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Broken Home.[wait:5] It's worth [sound:treasureappraise]D$50.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("grass_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("BrokenHome", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("HolyNectar") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Holy Nectar.[wait:5] It's worth [sound:treasureappraise]D$75.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("grass_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("HolyNectar", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("ColoredFrontiers") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Colored Frontier.[wait:5] It's worth [sound:treasureappraise]D$200.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("tile_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("ColoredFrontiers", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("RubberUgly") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Rubber Ugly.[wait:5] It's worth [sound:treasureappraise]D$75.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("tile_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("RubberUgly", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("AdamantineGirdle") then
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is the Adamantine Girdle.[wait:5] It's worth [sound:treasureappraise]D$125.)")
            local current_time = Game.music:tell()
            Game.music:fade(0, 0.5)
            Game.music:play("metal_theme", 0)
            Game.music:seek(current_time)
            Game.music:fade(1, 0.1)
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("AdamantineGirdle", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        elseif Game:getFlag("TheKey") then
            local auto = {
                ["auto"] = true
            }
            cutscene:text("* (Got a treasure?[wait:5] Let's see...)")
            cutscene:text("* (This is The Key.[wait:5] It's worth [sound:treasureappraise]D$100.)")
            cutscene:text("* (Also, it brings a message...)")
            cutscene:text("* (Challenge mode can now be accessed from the title screen)", auto)
            cutscene:text("* (Oh wait wait wait $#!! my bad)")
            cutscene:text("* (That's for a different game)")
            cutscene:text("* (I think you're instead meant to unlock some sort of door with this)")
            cutscene:text("* (Yeah so actually you won't get [sound:treasureappraisereverse]D$100 from this because you'd better keep this)")
            cutscene:text("* (But hey,[wait:5] we're done![wait:5] Let's enter the geyser and get out of this hellhole)")
            Game:setFlag("isCarryingTreasure", false)
            Game:setFlag("TheKey", false)
            local count = Game:getFlag("treasuresCollected", 0)
            Game:setFlag("treasuresCollected", count + 1)
        else
            cutscene:text("* (Time is money.[wait:5] Don't waste my time!)")
        end
        if Game:getFlag("treasuresCollected", 0) >= 5 and Game:getFlag("inSublevel1") then --dude dont even ask
            Game:setFlag("sublevel1_clear", true)
        elseif Game:getFlag("treasuresCollected", 0) >= 7 and Game:getFlag("inSublevel2") then
            Game:setFlag("sublevel2_clear", true)
            Game:setFlag("sublevel1_clear", false)
        elseif Game:getFlag("treasuresCollected", 0) >= 9 and Game:getFlag("inSublevel3") then
            Game:setFlag("sublevel3_clear", true)
            Game:setFlag("sublevel2_clear", false)
        elseif Game:getFlag("treasuresCollected", 0) >= 10 and Game:getFlag("inSublevel4") then
            Game:setFlag("sublevel4_clear", true)
            Game:setFlag("sublevel3_clear", false)
        elseif Game:getFlag("treasuresCollected", 0) >= 11 and Game:getFlag("inSublevel5") then
            Game:setFlag("sublevel5_clear", true)
            Game:setFlag("sublevel4_clear", false)
        end
        if Game:getFlag("sublevel1_clear") then
            local ev = Game.world.map:getEvent(92)
            if ev then ev:remove() end
        end
        if Game:getFlag("sublevel2_clear") then
            local ev = Game.world.map:getEvent(172)
            if ev then ev:remove() end
        end
        if Game:getFlag("sublevel3_clear") then
            local ev = Game.world.map:getEvent(94)
            if ev then ev:remove() end
        end
        if Game:getFlag("sublevel4_clear") then
            local ev = Game.world.map:getEvent(117)
            if ev then ev:remove() end
        end
        if Game:getFlag("sublevel5_clear") then
            local ev = Game.world.map:getEvent(5)
            if ev then ev:remove() end
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
                            Game:setFlag("inSublevel1", true) --grr no global variables allowed, check other note for why
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
                        Game.music:stop()
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
                                Game.world:loadMap("chapter1/farm_world/flowerden5", "spawn")
                                Game:setFlag("inSublevel5", true)
                                Game:setFlag("inSublevel4", false)
                                for _, party_member in ipairs(Game.party) do
                                    party_member:heal(200)
                                end
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel3") then
                                Game.world:loadMap("chapter1/farm_world/flowerden4", "spawn")
                                Game:setFlag("inSublevel4", true)
                                Game:setFlag("inSublevel3", false)
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel2") then
                                Game.world:loadMap("chapter1/farm_world/flowerden3", "spawn")
                                Game:setFlag("inSublevel3", true)
                                Game:setFlag("inSublevel2", false)
                                Kristal.saveGame()
                            elseif Game:getFlag("inSublevel1") then
                                Game.world:loadMap("chapter1/farm_world/flowerden2", "spawn")
                                Game:setFlag("inSublevel2", true)
                                Game:setFlag("inSublevel1", false)
                                Kristal.saveGame()
                            end
                            cutscene:wait(cutscene:fadeIn(0.5))
                            if Game:getFlag("inSublevel5") then
                                local finalfloor = Text("[color:yellow]FINAL FLOOR!", 170, 238)
                                finalfloor:setScale(2)
                                finalfloor.layer = WORLD_LAYERS["ui"]
                                Assets.playSound("pik2finalfloor")
                                cutscene:wait(1.9)
                                Game.stage:addChild(finalfloor)
                                cutscene:wait(1)
                                finalfloor:fadeOutAndRemove()
                            end
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
    cant_proceed_cave = function(cutscene, event)
        cutscene:text("* (Seemed like more treasures could be found...)")
    end;
    cave_escape = function(cutscene, event)
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
                    local caveDesc = Text("Escape the cave and leave for good?")
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
                        Game.music:stop()
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
                            cutscene:wait(cutscene:fadeOut(0.1))
                            Game.world:loadMap("chapter1/farm_world/garden_pikmin2cave", "spawn")
                            Game:setFlag("finishedFlowerDen", true)
                            Game.money = Game.money + 691
                            Kristal.saveGame()
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