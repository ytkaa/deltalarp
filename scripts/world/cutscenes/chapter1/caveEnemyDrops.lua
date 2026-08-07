return {    
    sublevel3ColoredFrontiers1 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(58)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel3ColoredFrontiers2 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(60)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel3ColoredFrontiers3 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(61)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel3ColoredFrontiers4 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(79)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel3ColoredFrontiers5 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(65)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel3Boulder = function(cutscene, event)
            Game.world:setBattle(true)
            local player = Game.world.player
            for i = 1, 3 do
                local boulder = Sprite("effects/fallingShadow/boulder", player.x, player.y)
                local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
                boulder:setHitbox(0, 0, boulder.width, boulder.height)
                fallingShadow:setPosition(player.x, player.y)
                fallingShadow:setOrigin(0.5)
                fallingShadow:setLayer(1)
                boulder:setOrigin(0.5)
                boulder:setLayer(1)
                Game.world:addChild(fallingShadow)
                Game.world:addChild(boulder)
                cutscene:enableMovement();
                Assets.playSound("boulder")
                Game.world.timer:tween(1, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
                boulder:setPosition(player.x, player.y - 2000)
                cutscene:wait(cutscene:slideTo(boulder, player.x, player.y, 1))
                if boulder:collidesWith(player) then
                    Assets.playSound("hurt")
                    Game.world:hurtParty(5)
                    player:shake(10, 0.5)
                end
                fallingShadow:remove()
                boulder:remove()
                Assets.playSound("badexplosion")
                Game.world:shake(20, 0.5)
            end
            Game.world:setBattle(false)
    end;
    sublevel4BombRock = function(cutscene, event)
            Game.world:setBattle(true)
            local player = Game.world.player
            for i = 1, 3 do
                local distance = 60
                local x_offset = player.x
                local y_offset = player.y
                if player.facing == "up" then
                    y_offset = y_offset - distance
                elseif player.facing == "down" then
                    y_offset = y_offset + distance
                elseif player.facing == "left" then
                    x_offset = x_offset - distance
                elseif player.facing == "right" then
                    x_offset = x_offset + distance
                end
                x_offset = x_offset + MathUtils.random(-30, 30)
                y_offset = y_offset + MathUtils.random(-30, 30)
                local bombrock = Sprite("effects/fallingShadow/bombrock", player.x, player.y)
                local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
                bombrock:setHitbox(0, 0, bombrock.width, bombrock.height)
                fallingShadow:setPosition(x_offset, y_offset)
                fallingShadow:setOrigin(0.5)
                fallingShadow:setLayer(1)
                bombrock:setOrigin(0.5)
                bombrock:setLayer(1)
                Game.world:addChild(fallingShadow)
                Game.world:addChild(bombrock)
                cutscene:enableMovement();
                Assets.playSound("boulder")
                Game.world.timer:tween(0.50, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
                bombrock:setPosition(x_offset, y_offset - 2000)
                cutscene:wait(cutscene:slideTo(bombrock, x_offset, y_offset, 0.50))
                bombrock:flash()
                cutscene:wait(0.50)
                fallingShadow:remove()
                bombrock:remove()
                local explosion = Sprite("effects/fallingShadow/explosion", bombrock.x, bombrock.y)
                explosion:setHitbox(0, 0, explosion.width, explosion.height)
                explosion:setOrigin(0.5)
                explosion:setLayer(1)
                Game.world:addChild(explosion)
                if explosion:collidesWith(player) then
                    Assets.playSound("hurt")
                    Game.world:hurtParty(5)
                    player:shake(10, 0.5)
                end
                Assets.playSound("badexplosion")
                Game.world:shake(20, 0.5)
                explosion:fadeOutAndRemove(0.50)
            end
            Game.world:setBattle(false)
    end;
    sublevel4enemy1 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(102)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel4enemy2 = function(cutscene, event)
            local enemy = Game.world.map:getEvent(114)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
    end;
    sublevel4enemy3 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(105)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel4enemy4 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(115)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel4enemy5 = function(cutscene, event)
            local enemy = Game.world.map:getEvent(106)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
    end;
    sublevel4enemy6 = function(cutscene, event)
        if Game:getFlag("isCarryingTreasure") == true then
            local enemy = Game.world.map:getEvent(116)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 3, scale_y = 3}, "linear")
            enemy:setPosition(player.x, player.y - 1000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
        else
            return
        end
    end;
    sublevel5Boss = function(cutscene, event)
            local enemy = Game.world.map:getEvent(7)
            local player = Game.world.player
            local fallingShadow = Sprite("effects/fallingShadow/fallingShadow", player.x, player.y)
            fallingShadow:setPosition(player.x, player.y)
            fallingShadow:setOrigin(0.5)
            fallingShadow:setLayer(1)
            Game.world:addChild(fallingShadow)
            cutscene:enableMovement();
            Assets.playSound("fall")
            Game.world.timer:tween(1.0, fallingShadow, {scale_x = 15, scale_y = 15}, "linear")
            enemy:setPosition(player.x, player.y - 2000)
            cutscene:wait(cutscene:slideTo(enemy, player.x, player.y))
            fallingShadow:remove()
    end;
}