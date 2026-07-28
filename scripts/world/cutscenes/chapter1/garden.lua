return {
    barracks2 = function(cutscene, event)
        local colonel = cutscene:getCharacter("colonel", 2)
        local colonel2 = cutscene:getCharacter("colonel", 1)
        local colonel3 = cutscene:getCharacter("colonel", 3)
        local colonel4 = cutscene:getCharacter("colonel", 4)
        local colonel5 = cutscene:getCharacter("colonel", 5)
        local vess = cutscene:getCharacter("vess")
        local options = {
            ["talk"] = true;
        }
        cutscene:setSpeaker(colonel, true)
        cutscene:setTextboxTop(false)
        cutscene:setSprite(colonel, "talk", 1/6)
        if event.interact_count == 1 then
            cutscene:text("* Greetings, lieutenant !!", nil, colonel, options)
            cutscene:text("* FANTASTIC job evading the GARDNER !!", nil, colonel, options)
            cutscene:text("* Now we've pushed into the GARDEN !![wait:5] Operation Stalwart Kernel is complete...", nil, colonel, options)
            cutscene:text("* HOPE can truly bring us to victory !!", nil, colonel, options)
            cutscene:text("* That being said,[wait:5] this was as far as HQ wanted us to push for now.", nil, colonel, options)
            cutscene:text("* That means we won't be going ahead with you,[wait:5] lieutenant.", nil, colonel, options)
            cutscene:text("* So,[wait:5] that means this is goodbye...", nil, colonel, options)
            cutscene:wait(1)
            cutscene:text("* UNLESS !!", nil, colonel, options)
            cutscene:text("* UNLESS !!", nil, colonel, options)
            cutscene:text("* You wanna go and PATROL the FIELD of WHEAT and CORN...", nil, colonel, options)
            cutscene:text("* In which case,[wait:5] let me know anytime.", nil, colonel, options)
            cutscene:text("* The squad and I will be happy to accompany you.", nil, colonel, options)
        elseif event.interact_count >= 2 then
            cutscene:text("* Well lieutenant?[wait:5] What'll it be?")
            local choice = cutscene:choicer({"Yes \npatrol", "No \npatrol"})
            if choice == 1 then
                Game:setFlag("leading_colonels_squad", true)
                cutscene:text("* Alright lieutenant !!!!!!!!!")
                cutscene:text("* Lead the way !!")
                colonel:convertToFollower()
                colonel2:convertToFollower()
                colonel3:convertToFollower()
                colonel4:convertToFollower()
                colonel5:convertToFollower()
                Game:addFollower(colonel)
                Game:addFollower(colonel2)
                Game:addFollower(colonel3)
                Game:addFollower(colonel4)
                Game:addFollower(colonel5)
            else 
                cutscene:text("* Alrighty lieutenant.[wait:5] We'll be here.")
            end
        end
        cutscene:setSprite(colonel, "idle") 
    end;
    barracks2_partydisband = function(cutscene, event)
        local colonel = cutscene:getCharacter("colonel", 2)
        local colonel2 = cutscene:getCharacter("colonel", 1)
        local colonel3 = cutscene:getCharacter("colonel", 3)
        local colonel4 = cutscene:getCharacter("colonel", 4)
        local colonel5 = cutscene:getCharacter("colonel", 5)
        local vess = cutscene:getCharacter("vess")
        local options = {
            ["talk"] = true;
        }
        if Game:getFlag("leading_colonels_squad", true) then
            local mainColonel = Game.world.followers[1]
            local vessPos = vess:getPosition() --Lmao
            local followers = Game.world.followers
            cutscene:setTextboxTop(true)
            cutscene:setSpeaker(mainColonel, true)
            cutscene:setSprite(mainColonel, "talk", 1/6)
            cutscene:text("* We can't go any further, lieutenant.")
            cutscene:text("* Good luck in the GARDEN...")
            cutscene:text("* ...and give GARDNER hell !!")
            -- some sort of cheer sound effect
            cutscene:wait(cutscene:fadeOut(1))
            Assets.playSound("item")
            cutscene:setSprite(mainColonel, "idle")
            --Game.world:removeFollower(colonel, 2)
            --Game.world:removeFollower(colonel2, 1)
            --Game.world:removeFollower(colonel3, 3)
            --Game.world:removeFollower(colonel4, 4)
            --Game.world:removeFollower(colonel5, 5)
            for _, follower in pairs(followers) do
                Game.world:removeFollower(follower)
                follower:remove()
            end
            for _, follower in pairs(followers) do
                Game.world:removeFollower(follower)
                follower:remove()
            end
            for _, follower in pairs(followers) do
                Game.world:removeFollower(follower)
                follower:remove()
            end
            Game:setFlag("leading_colonels_squad", false)
            Game.world:loadMap("chapter1/farm_world/garden1")
            cutscene:wait(0.5)
            cutscene:look("vess", "up")
            cutscene:fadeIn(1)
        else
            return
        end
    end;
}