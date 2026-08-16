local BlueSoul, super = Class(Soul)

function BlueSoul:init(x, y)
    super.init(self, x, y)

	self.sprite:remove()
	self.sprite = Sprite("player/heart")
    self.sprite:setOrigin(0.5, 0.5)
    self.sprite.inherit_color = true
    self:addChild(self.sprite)

    self.color = ColorUtils.hexToRGB("#ff981d")
	self.rotation = 0
	self.baserot = -math.pi/2
    self.speed = 8

    self.speed_x = 0
    self.speed_y = 0
	self.graze_collider.collidable = false -- disable grazing
	
	self.charge_timer = 0
	self.max_charge = 10
	self.charge_sfx = nil
	self.chargecon = 0
	self.glow_timer = 0
	self.dashstate = 0
	self.controller = nil
	self.drawafterimages = true
	self.frametimer = 0
	self.hitstop = 0
	self.heartcooldown = 0
	self.stopdashbuffer = 0
	
	Game.battle.timer:every(1/30, function()
		if self.sprite and (not self.transitioning) and self.controller then
		local aft = Sprite("player/heart")
		aft:setOrigin(0.5, 0.5)
		aft.inherit_color = true
		aft.rotation = self.rotation
		aft.x = self.x
		aft.y = self.y
		aft.color = self.color
		aft.layer = BATTLE_LAYERS["above_arena"]
		Game.battle:addChild(aft)
		table.insert(self.controller.afterimages, aft)
		end
	end)
	
	if Game.battle.encounter.orangeController then
		self.controller = Game.battle.encounter.orangeController
	else
		local new = OrangeSoulController()
		Game.battle:addChild(new)
		Game.battle.encounter.orangeController = new
		self.controller = Game.battle.encounter.orangeController
	end
end
function BlueSoul:update()
	super.update(self)
	
	if self.transitioning then
		self.rotation = 0
        if self.charge_sfx then
            self.charge_sfx:stop()
            self.charge_sfx = nil
        end
        return
    else
		self.rotation = self.baserot
	end
	
	if Game.battle.encounter.orangeController then
		self.controller = Game.battle.encounter.orangeController
	else
		local new = OrangeSoulController()
		Game.battle:addChild(new)
		Game.battle.encounter.orangeController = new
		self.controller = Game.battle.encounter.orangeController
	end
	
	if self.hitstop > 0 then
		self.hitstop = self.hitstop - DTMULT
		return
	end
	
	self.heartcooldown = MathUtils.approach(self.heartcooldown, 0, DTMULT)
	
	if (self.chargecon == 0 and self.heartcooldown <= 0) then
        if (Input.down("confirm")) then
            self.chargecon = 1;
            self.charge_sfx = Assets.getSound("chargeshot_charge")
            self.charge_sfx:setLooping(true)
            self.charge_sfx:setPitch(0.1)
            self.charge_sfx:setVolume(0.5)
			self.charge_sfx:play()
            self.charge_timer = 0;
            self.glow_timer = 0;
        end
    end
	
	if (self.chargecon == 1) then
        if (Input.down("confirm")) then
            self.dashstate = 1;
            self.charge_timer = MathUtils.approach(self.charge_timer, 16, 1*DTMULT);
			if self.charge_sfx then
				self.charge_sfx:setPitch(math.min(0.5 + ((self.charge_timer * 0.05)), 1))
			end
            
			self.controller.fakecamxspeedadditional = math.min(self.charge_timer, 8) * 0.5;
        else
            if (self.charge_timer == 16) then
                self.chargecon = 2;
                self.dashtimer = 0;
            else
                self.charge_timer = 8 + (self.charge_timer * 0.5);
                self.chargecon = 2;
                self.dashtimer = 0;
            end
			Assets.playSound("snd_explosion_mmx3", 0.5, 2)
			self.charge_sfx:stop()
        end
    end
	
	if (self.chargecon == 2) then
        self.dashstate = 2;
        self.dashing = 1;
            
        self.controller.fakecamxspeedadditional = -(2 + self.charge_timer);
        self.chargecon = 3;
    end
        
    if (self.chargecon == 3) then
        local dashtarg = 4 + self.charge_timer;
        self.dashtimer = self.dashtimer + DTMULT;
		local t = self.dashtimer / dashtarg
		t = 1 - (1 - t)^DTMULT
        self.controller.fakecamxspeedadditional = MathUtils.lerp(
			self.controller.fakecamxspeedadditional,
			0,
			t
		)
            
        if (self.controller.fakecamxspeedadditional >= -1) then
            self.heartcooldown = 2;
            self.charge_timer = 0;
            self.dashstate = 0;
            self.controller.fakecamxspeedadditional = 0;
            self.chargecon = 0;
            self.dashtimer = 0;
            self.stopdashbuffer = 4;
        end
    end
        
    if (self.chargecon == 4 or self.chargecon == 5) then
    end
	
	if (self.dashstate == 0 or self.chargecon == 0 or self.chargecon == 1) then
        self.stopdashbuffer = self.stopdashbuffer - DTMULT;
        
        if (self.stopdashbuffer <= 0) then
            self.dashing = 0;
		end
    end
end
function BlueSoul:doMovement()
    local speed = self.speed
	
	if (self.chargecon == 1) then
        speed = speed * 0.8333333333333334;
	end

    -- Do speed calculations here if required.

    if self.allow_focus then
        if Input.down("cancel") then speed = speed / 2 end -- Focus mode.
    end
	
	if self.hitstop > 0 then
		return
	end

    local move_x, move_y = 0, 0

    -- Keyboard input:
    if Input.down("up") then move_y = move_y - 1 end
    if Input.down("down") then move_y = move_y + 1 end

    self.moving_y = move_y

    if move_x ~= 0 or move_y ~= 0 then
        if not self:move(0, move_y, speed * DTMULT) then
            self.moving_y = 0
        end
    end
end

function BlueSoul:draw()
	if self.transitioning then
		super.draw(self)
		return
	end
	local camspeed = 0;

	if self.controller then
		camspeed = math.min((self.controller.fakecamxspeedbase * 0.25) + (self.controller.fakecamxspeedadditional * 2), 0);
	end
	
	local r,g,b,a = 1, 1, 0, 1
	local circle_timer = math.min(self.charge_timer*2, 35)
    if circle_timer > 0 and self.dashstate == 1 and self.charge_timer < 16 then
        local circle = Assets.getTexture("player/shot/charge")
		local alf = (self.charge_timer / 10) - 0.2;
        love.graphics.setColor(r,g,b,0.25 + (alf * 0.75))
        for i=1,4 do
            local angle = (i*math.pi/2) - (circle_timer * math.rad(5))
            local x, y = math.cos(angle) * (35 - circle_timer), math.sin(angle) * (35 - circle_timer)
            local scale = Utils.clampMap(circle_timer, 0,35, 4,2)
            x, y = x - circle:getWidth()/2 * scale, y - circle:getHeight()/2 * scale
            love.graphics.draw(circle, x, y, 0, scale)
        end
    end
	
	if drawafterimages then
		local af = AfterImage(self.sprite, 1, 0.1)
		Game.battle:addChild(af)
	end
	
	r,g,b,a = self:getDrawColor()
	love.graphics.setColor(1.0, 204/255, 15/255)
	local outline = Assets.getFrames("player/brave/outline")
	local outlineamount = (self.charge_timer*1.25)
	if self.dashstate == 2 then
		outlineamount = math.abs(self.controller.fakecamxspeedadditional * 1.11)
	end
	love.graphics.draw(outline[0], 10, -10, -self.rotation, 1)
	if self.chargecon == 1 or self.dashstate == 2 then
		Draw.scissor(-10, -10, 20, outlineamount)
		love.graphics.draw(outline[1], 10, -10, -self.rotation, 1)
		love.graphics.setScissor()
	end
	super.draw(self)
	if (self.dashstate == 1 and self.charge_timer == 16) then
		self.glow_timer = self.glow_timer + 0.5;
		love.graphics.setColor(1, 1, 1, 0.5 + (math.sin(self.glow_timer) * 0.5))
		love.graphics.draw(outline[1], 10, -10, -self.rotation, 1)
	end
	love.graphics.setBlendMode("add")
	if (self.dashstate == 2) then
		local dash = Assets.getFrames("player/brave/dash")
		local heartt = Assets.getTexture("player/heart")
		self.frametimer = self.frametimer + DTMULT
		a = 0.45 + (math.sin(self.frametimer * 1.5) * 0.2)
		love.graphics.setColor(r,g,b,a)
		local frame = math.floor(self.frametimer%3)
		if (self.chargecon ~= 5) then
			--draw_sprite_ext(spr_orangeheart_dash, global.time, x - 2, y - height, (image_xscale * 1.25) - (0.45 + (sin(global.time * 1.5) * 0.2)), image_yscale, _angle, image_blend, 0.45 + (sin(global.time * 1.5) * 0.2))
			love.graphics.draw(dash[frame], 10, -10, -self.rotation, (1.25 - (0.45 + (math.sin(self.frametimer * 1.5) * 0.2))), 1, 39, 3)
		end
    
		a = 0.225 + (math.sin(self.frametimer * 1.5) * 0.1)
		love.graphics.setColor(1,1,0,a)
		if (self.chargecon ~= 5) then
			--draw_sprite_ext(spr_orangeheart_dash, global.time, x - 2, y - height, (image_xscale * 1.25) - (0.225 + (sin(global.time * 1.5) * 0.1)), image_yscale, _angle, image_blend, 0.225 + (sin(global.time * 1.5) * 0.1));
			love.graphics.draw(dash[frame], 10, -10, -self.rotation, (1.25 - (0.225 + (math.sin(self.frametimer * 1.5) * 0.1))), 1, 39, 3)
		end
		a = 0.45 + (math.sin(self.frametimer * 1.5) * 0.2)
		love.graphics.setColor(1,1,1,a)
		love.graphics.draw(heartt, -8, -8)
	else
		self.frametimer = 0
	end
	love.graphics.setBlendMode("alpha")
end

return BlueSoul
