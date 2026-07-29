---@class Zobate : Shop
local Zobate, super = Class(Shop, "zobate")

function Zobate:init()
    super.init(self)

    self.background = "shops/zobate"
    self.shop_music = "itahu_1"

    -- This makes the shopkeeper slide when you enter the BUY menu
    self.shopkeeper.slide = true
    -- This places the actor we've just created
    self.shopkeeper:setActor("zobate_shop")
    self.shopkeeper:setAnimation("talk")

    self.encounter_text = "* And so,[wait:5] the Vessel[wait:5] approaches...[wait:5] \nItahu,[wait:8] itahu."
    self.shop_text = "* Gumana."
    self.leaving_text = "* Nirero,[wait:5] Vessel.[wait:5] Keep an active mind..."
    self.buy_menu_text = "Do my wares entertain?"
    --self.buy_confirmation_text = "%s..."
    self.buy_refuse_text = "Of course,[wait:5] of course."
    self.buy_text = "Thanks,[wait:5] \nI suppose."
    self.buy_storage_text = "Thanks,[wait:5] \nI suppose."
    self.buy_too_expensive_text = "Zah ha ha.[wait:5] \nToo much for you..."
    self.buy_no_space_text = "Zah.[wait:5] You have taken enough."
    self.sell_no_price_text = "I refuse,[wait:5] \nI refuse..."
    self.sell_menu_text = "Gitau, then.[wait:5] Entertain me..."
    self.sell_nothing_text = "You do not have..."
    self.sell_refuse_text = "Of course,[wait:5] of course..."
    self.sell_text = "Here...[wait:5] your fair share."
    self.sell_no_storage_text = "Zah ha ha.[wait:5] \nYou appear to have not..."
    self.sell_everything_text = "That is all...[wait:5] \nGood show."
    self.talk_text = "Itahu...[wait:5] What to discuss..?"
    self.sell_options_text.items = "Act out your show for me..."
    self.sell_options_text.weapons = "Has a weapon \nlost your attention?"
    self.sell_options_text.armors = "Your wears,[wait:5] your wares."
    self.sell_options_text.storage = "What do you have in store,[wait:5] Vessel..?"
    
    self:registerItem("tubular_key")
    self:registerItem("zip_shield")
    self:registerItem("cornmeal")
    self:registerItem("kipcarrot")


    self:registerTalk("About you")
    self:registerTalk("About Gardner")
    self:registerTalk("About this world")
    self:registerTalk("About me")
    self:registerTalkAfter("About show", 1)
    
end

function Zobate:startTalk(dialogue)
    if dialogue == "About you" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* LMAO I Haven't Written Any Dialogue Yet",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About show" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* LMAO I Haven't Written Any Dialogue Yet",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About Gardner" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* LMAO I Haven't Written Any Dialogue Yet",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About this world" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* LMAO I Haven't Written Any Dialogue Yet",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About me" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* LMAO I Haven't Written Any Dialogue Yet",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    end
end

return Zobate