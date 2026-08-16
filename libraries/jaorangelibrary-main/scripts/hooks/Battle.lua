local Battle, super = HookSystem.hookScript(Battle)

function Battle:onDefendingBeginState()
	super.onDefendingBeginState(self)
	if self.encounter.orangeController then
		self.encounter.orangeController:doScaleFactor()
	end
end

return Battle