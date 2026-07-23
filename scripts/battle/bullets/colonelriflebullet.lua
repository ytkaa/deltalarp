local ColonelRifleBullet, super = Class(Bullet)

function ColonelRifleBullet:init(x, y)
    super.init(self, x, y, "bullets/colonel/gunbullet")
end

function ColonelRifleBullet:update()
    super.update(self)
    self.timer = 0
    self.timer = self.timer + DTMULT --creates a cool little after effect fade, stolen code from https://discord.com/channels/899153719248191538/1295149402314506282/1523943168582750288 that you might wanna check out cuz its cool (kristal discord)
    if self.parent then
        while self.timer >= 1 do
            self.parent:addChild(AfterImage(self, 0.5, 0.1))
            self.timer = self.timer - 1
        end
    end
end

return ColonelRifleBullet