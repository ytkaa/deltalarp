local ChaserEnemy, super = HookSystem.hookScript(ChaserEnemy)

function ChaserEnemy:onCollide(player)
    if self:isActive() and player:includes(Player) then
        self.encountered = true

        if not self.encounter then
            error("ChaserEnemy has no encounter set!")
        end

        --print("We're cooked.")
        if self.enemy == "gardner" then
            Game.world:startCutscene("chapter1/farm_world", "gardner_caught")
        else
            self.world.encountering_enemy = true
            self.sprite:setAnimation("hurt")
            self.sprite.aura = false
            Game.lock_movement = true
            self.world.timer:script(function(wait)
                Assets.playSound("tensionhorn")
                wait(8 / 30)
                local src = Assets.playSound("tensionhorn")
                src:setPitch(1.1)
                wait(12 / 30)
                self.world.encountering_enemy = false
                Game.lock_movement = false
                local enemy_target = self ---@type ChaserEnemy|table[]
                if self.enemy then
                    enemy_target = { { self.enemy, self } }
                end
                Game:encounter(self.encounter, true, enemy_target, self)
            end)
        end
    end
end

return ChaserEnemy