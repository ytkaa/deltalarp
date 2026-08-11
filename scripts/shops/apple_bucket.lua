local AppleBucket, super = Class(Shop)

function AppleBucket:init()
    super.init(self)

    --Fixes music bug
    self.shop_music = nil

    self.encounter_text = "[sound:grab][wait:15]* (You dunk your head into a bucket \nfilled with commodities.)"
    self.shop_text = "* (Apple store.)"
    self.leaving_text = "* (You took your head out of the bucket.)"
    self.buy_menu_text = "* Buy."
    self.buy_refuse_text = "* Make a purchase."
    self.buy_text = "* The bucket accrues wealth."
    self.buy_storage_text = "* The bucket accrues wealth."
    self.buy_too_expensive_text = "* The bucket laughs..."

    -- With this, the map is not hidden
    self.hide_world = false
    -- This is the menu options. First is the text and Second is the State
    self.menu_options = {
        {"Buy",  "BUYMENU" },
        {"Bob", "BOB" }, -- Replaces the SELL menu
        {"Rob", "ROB" }, -- Replaces the TALK menu
        {"Flee", "LEAVE" }
    }
    -- Removes black rectangle behind UI
    self.bg_cover:remove()

    self:registerItem("slice")
    self:registerItem("candy_lance")
    self:registerItem("leaf")
    self:registerItem("dark_energy_ii")
end

function AppleBucket:onStateChange(old, new)
    super.onStateChange(self, old, new)
    if new == "BOB" then
        self:startDialogue({"[sound:wing][wait:15]* (You bobbed.)", "* (Though,[wait:5] for what,[wait:5] it is unknown...)", "* (...[wait:5]there's not even any apples in \nthis bucket...)"})
    elseif new == "LEAVE" then
        Assets.playSound("grab_reverse")
    elseif new == "ROB" then
        self:startDialogue({"[sound:wing][wait:15]* (...)", "* (You failed...[sound:awkward])"})
    end
end

return AppleBucket