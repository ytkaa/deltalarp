local BloomerTrigger, super = Class(Event)

function BloomerTrigger:init(x, y, shape, properties)
    super.init(self, x, y, shape, properties)
    self.group = properties["group"] or 1
    self.solid = false
end

function BloomerTrigger:onEnter(chara)
    if chara.is_player then
        for _, bloomer in pairs(Game.world:getEvents("bloomer")) do
            if bloomer.group == self.group then
                print("We are group " .. tostring(bloomer.group) .. "!")
                if bloomer.x < chara.x then
                    Game.world:spawnBullet("bloombullet", bloomer.x, bloomer.y - 35, 0)
                    bloomer:setSprite("world/events/bloomer/shoot_left")
                    bloomer.sprite:play(1/5, false, function() bloomer:setSprite("world/events/bloomer/idle", 1/math.random(2, 6))end)
                else
                    Game.world:spawnBullet("bloombullet", bloomer.x, bloomer.y - 35, math.pi)
                    bloomer:setSprite("world/events/bloomer/shoot")
                    bloomer.sprite:play(1/5, false, function() bloomer:setSprite("world/events/bloomer/idle", 1/math.random(2, 6))end)
                end
            end
        end
        Assets.playSound("bloomer", 1, 1/math.random(5, 8))

        return true;
    end
end

return BloomerTrigger