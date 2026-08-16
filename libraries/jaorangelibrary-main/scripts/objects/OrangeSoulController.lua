local OrangeController, super = Class(Object)

function OrangeController:init()
	super.init(self)
	
	self.fakecamx = 0;
	self.fakecamxspeed = -16;
	self.fakecamxspeedbase = -16;
	self.fakecamxspeedbase_original = -16;
	self.fakecamxspeedadditional = 0;
	self.fakecamxspeeddefault = self.fakecamxspeed;
	
	self.do_lines = 0.25
	self.scale_factor = 0
	self.layer = BATTLE_LAYERS["above_arena"]
	self.afterimages = {}
end

function OrangeController:doScaleFactor()
	if self.scale_factor == 0 then
	self.scale_factor = 0
	Game.battle.timer:tween(12 / 30, self, { scale_factor = 1.1 }, "out-sine")
	Game.battle.timer:after(13 / 30, function()
		Game.battle.timer:tween(12 / 30, self, { scale_factor = 1 }, "in-sine")
	end)
	end
end

function OrangeController:update()
	super.update(self)
	
	self.fakecamxspeed = self.fakecamxspeedbase + self.fakecamxspeedadditional;
    self.fakecamx = self.fakecamx + (self.fakecamxspeed*DTMULT);
	
	if Game.battle.arena and (#Game.battle.waves > 0) then
		for _,q in pairs(Game.battle.waves) do
			for i,v in pairs(q.bullets) do
				v.x = v.x + (self.fakecamxspeed*DTMULT)
			end
		end
	end
	for i,v in pairs(self.afterimages) do
		local camspeed = math.min((self.fakecamxspeedbase * 0.25) + (self.fakecamxspeedadditional * 2), 0);
		v.x = v.x + (camspeed*DTMULT)
		v.alpha = v.alpha - DTMULT/9
		if v.alpha < 0 then
			v:remove()
			table.remove(self.afterimages, i)
		end
	end
	if Game.battle.arena then
		--Game.battle.arena:setSize(75*12, 217 * (0.5 + (self.scale_factor/2)))
	else
		self.fakecamx = 0
		self.scale_factor = 0
	end
	print(self.scale_factor)
end

function OrangeController:draw()
	local sx, sy = Game.battle.arena and Game.battle.arena:getScale() or 0
	if (not Game.battle.arena) or (sx ~= 1) then
		--self.fakecamx = 0
		return
	end
	super.draw(self)

    love.graphics.setColor(1,1,1,0.25)
	local screenspace = 680
	local space = screenspace / 5

	for i = 0, (screenspace / space) - 1 do
		local xpos = 0 + ((self.fakecamx + i * space) % screenspace)
		local yscale = 40 + (177 * self.scale_factor)
		if (self.fakecamx + i * space) < 0 then
			love.graphics.rectangle("fill", xpos,(Game.battle.arena.top+((Game.battle.arena.bottom-Game.battle.arena.top)/2))-(yscale/2)-2,8,yscale)
		end
	end
end

return OrangeController