local OrangeBreakBullet, super = Class(Bullet)

function OrangeBreakBullet:init(x, y, texture)
	super.init(self, x, y, texture)
	self:setColor({ 0, 0.5, 1, 1 })
	self.destroy_on_hit = false
end

function OrangeBreakBullet:onBreak(soul)
	soul.controller.hitstop = 1
	soul.hitstop = 1
	soul.dashtimer = MathUtils.clamp(soul.dashtimer - 16, 0, soul.dashtimer);
    if (soul.chargecon == 0 or soul.chargecon == 3) then
        soul.chargecon = 2;
	end
	Game:giveTension(self:getGrazeTension())
	self:remove()
	Assets.playSound("damage", 0.6, 1.4);
	Assets.playSound("snd_paper_rise", 1, 1.75);
end

function OrangeBreakBullet:onCollide(soul)
	if soul.dashing == 1 then
		self:onBreak(soul)
	else
		super.onCollide(self, soul)
	end
end

return OrangeBreakBullet