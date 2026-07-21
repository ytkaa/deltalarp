---The function that will be executed
---@param event Event The event that executes this script
---@param player Player The player that executes this script
---@param facing string The direction the player is facing. Only set if the script is executed in a interactable or NPC event
return function(event, player, facing)
    Game.inventory:addItem("candycorn")
end