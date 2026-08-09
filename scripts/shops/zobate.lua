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

    -- The actual documented way to do this doesn't $$$$ing work
    if Game:getFlag("zobate_quest", false) then
        self:registerTalkAfter("Show", 4)
    else
        self:registerTalkAfter("Show?", 4)
    end
    
    
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
            "[emote:oh]* Least,[wait:5] that was until...[wait:10] \nthe [color:red]KNIGHTS[color:reset][wait:5] appeared...",
            "[emote:idle]* ...",
            "[emote:talk]* Ultimately.[wait:5] He was informed of the power of[wait:5] [color:pink]life force[color:reset][wait:5] and its extraction.[wait:5] A power that he has gone mad with...",
            "[emote:talk]* A power that...[wait:5] welph...",
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
            "[emote:oh]* About me..?",
            "[emote:slight_smile]* Zah.[wait:5] welph...[wait:5]",
            "[emote:talk]* My name is...[wait:5] Zobate.[wait:5] I am not of this strange world.",
            "[emote:talk]* Itahu,[wait:5] itahu...[wait:5] Once,[wait:5] I was not a mere,[wait:5] lowly shopkeeper.[wait:5] I was the keeper...[wait:5] [emote:slight_smile]of the show,[wait:5] zah ha ha.",
            "[emote:talk]* I was part of an old quartet.[wait:5] The old quartet of entertainment.",
            "[emote:slight_smile]* The quartet...[wait:5] we...[wait:5] performed together.",
            "[emote:smile]* We entertained together,[wait:5] we \nlaughed together...[wait:5] we cried together!",
            "[emote:slight_smile]* We were as one.[wait:20] [emote:idle]That is,[wait:5] until[wait:5] [emote:oh]\nthat fateful day...",
            "[emote:oh_sad]* ...[wait:5]that day...[wait:20] Kate...",
            "[emote:idle]* ...[wait:10][emote:bitter]Kate.",
            "[emote:talk]* Ultimately.[wait:5] I.",
            "[emote:idle]* ...",
            "[emote:bitter]* I was excised.[wait:5] From that old quartet.[wait:5] Cast out to this place,[wait:5] this shop.[wait:10] [emote:oh_sad]Never to begin that \nlast show.",
            "[emote:talk]* A shame.",
            "[emote:idle]* That one last show...[wait:5] [emote:talk]a shame it never was fruition,[wait:5] zah.[wait:5] [emote:slight_smile]But fate is unchanging...[wait:5] it is,[wait:5] it is.",
            "[emote:talk]* Gitau."
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    elseif dialogue == "Show?" then
        self:startDialogue({
            --emotes get used here
            "[emote:oh]* Show...?[wait:5] You have interest?",
            "[emote:talk]* Welph...[wait:5] I do not believe possible.",
            "[emote:idle]* ...",
            "[emote:idle]* But...[wait:5] hm...[wait:5] Vessel.[wait:5] You do possess a certain power,[wait:5] hokero...",
            "[emote:talk]* Perhaps your power could be put in use...",
            "[emote:slight_smile]* ...",
            "[emote:smile]* Zah ha ha,[wait:5] I will tell you my knowledge.",
            "[emote:talk]* There is an area,[wait:5] a space.[wait:5] A space rife with an air of entertainment and showdom.",
            "[emote:oh]* But it is locked away...[wait:5] away in that field below...",
            "[emote:talk]* As addition,[wait:5] there is three [wait:10][color:yellow]KEYS[color:reset].",
            "[emote:talk]* One[wait:10] is TREASURE.[wait:20]\nOne[wait:10] is BARN.[wait:20]\n",
            "[emote:slight_smile]* One...[wait:10] I possess,[wait:5] and you will take.",
            "[emote:slight_smile]* (You got the MysteryKey.)[sound:item]",
            "[emote:talk]* I may not,[wait:5] but,[wait:5] if you believe possible...[wait:5] trace the [color:yellow]KEYS[color:reset] and enter that area.",
            "[emote:slight_smile]* If it is possible...[wait:5] you will find me there,[wait:5] and we will have that last show.[wait:5] [emote:smile]Zah ha ha!",
            "[emote:smile][noskip]* ([sound:cd_bagel/noelle][color:yellow]NEW QUEST[color:reset]:[wait:20] Zobate's [color:purple]LAST SHOW[color:reset]!)[wait:1s]"
        }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
            Game.inventory:addItem("mystery_key")
            Game:setFlag("zobate_quest", true)
            self:registerTalkAfter("Show", 4)
        end)
    elseif dialogue == "Show" then
        self:startDialogue({
            --emotes get used here
            "[emote:slight_smile]* One is TREASURE,[wait:5] one is BARN...",
            }, function ()
            -- Use this to reset the animation of the shopkeeper
            self.shopkeeper:setSprite("talk")
        end)
    end
end

return Zobate