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

    
    self:registerTalk("About this world")
    self:registerTalk("About GARDNER")
    self:registerTalk("About me")
    self:registerTalk("About you")
    self:registerTalkAfter("About show", 4)
    
end

function Zobate:startTalk(dialogue)
    if dialogue == "About this world" then
        self:startDialogue({
            --emotes get used here
            "[emote:talk]* This world...[wait:5] it is a strange one,[wait:5] gitau.",
            "[emote:talk]* One hand...[wait:5] a world heading toward certain tragedy...",
            "[emote:talk]* Not too dissimilar to your own,[wait:5] Vessel.[wait:5] [emote:slight_smile]Perhaps not too unrelated,[wait:5] either...[wait:5] zah ha ha...",
            "[emote:talk]* The other hand,[wait:5] a world allowing for an unfamiliar movement,[wait:5] a nascent breath...[wait:5] hokero.",
            "[emote:talk]* Is quite entertaining,[wait:5] I must confess.",
            "[emote:talk]* To watch these many[wait:5] “souls”[wait:5] who,[wait:5] without darkness,[wait:5] would retain their[wait:5] “original”[wait:5] states...",
            "[emote:talk]* Gitau,[wait:5] gitau...[wait:5] To short,[wait:5] speaking to crops and inanimates entertains me.[wait:5] Zah ha ha.",
            "[emote:oh]* Though my face does not assume the form of hilarity...[wait:5] zah.",
            "[emote:slight_smile]* Deeply,[wait:5] I would prefer being the one entertaining,[wait:5] but legend and fate has chosen...[wait:5] [emote:idle]a different \npath for myself,[wait:5] I suppose...",
            "[emote:talk]* Itahu.",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About GARDNER" then
        self:startDialogue({
            --emotes get used here
            "[emote:smile]* Zah ha ha,[wait:5] the Gardner...[wait:5] [emote:talk]I assume I am to exposit?[wait:5] Itahu...",
            "[emote:talk]* Welph,[wait:5] there was once...[wait:5] a time[wait:5] which the Gardner was an equal to the others,[wait:5] the other Darkners...",
            "[emote:oh]* Least,[wait:5] that was until the[wait:10] [color:red]KNIGHTS[color:reset] appeared...",
            "[emote:idle]* ...",
            "[emote:talk]* Ultimately.[wait:5] He was informed of the power of[wait:5] [color:pink]life force[color:reset].[wait:5] A power that he has gone mad with...",
            "[emote:talk]* A power that...",
            "[emote:slight_smile]* ...",
            "[emote:oh]* As an extent,[wait:5] it is understandable...[wait:5] [emote:talk]many would do similar for a fraction of such a power.",
            "[emote:talk]* To think what he would do if one threatened to dissolve that power...[wait:5]",
            "[emote:slight_smile]* Welph,[wait:5] it would make a good show,[wait:5] it would.[wait:5] Za ha ha..."
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About me" then
        self:startDialogue({
            --emotes get used here
            "[emote:oh]* About you..?",
            "[emote:slight_smile]* You are...[wait:10] the Vessel.",
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "About you" then
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
    end
end

return Zobate