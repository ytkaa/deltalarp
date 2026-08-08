---@class Racing : Object
local Racing, super = Class(Object)

function Racing:init()
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    -- Variables tracking speed, track layout, and progress
    self.speed = 0
    self.max_speed = 10
    self.track_position = 0
    self.player_x = 0 -- Horizontal offset on the road (-1 to 1)
    
    -- Define segments of the track (e.g., straight, curve left, curve right)
    self.track = {
        {length = 100, curve = 0},
        {length = 250, curve = -50},  -- Curve right
        {length = 500, curve = 0},
    }
    
    -- Load visual elements from your mod's assets
    self.dashboard_sprite = Assets.getTexture("dashboard")
    self.bg_sprite = Assets.getTexture("racing_bg")

end

function Racing:draw()
    -- 1. Draw your background horizon
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.bg_sprite, 0, 0)

    -- 2. Draw the road pseudo-3D lines
    local horizon = 160 -- Y-coordinate where the sky meets the road
    local road_w = SCREEN_WIDTH * 2  -- Width of the road at the bottom of the screen
    
    local current_curve = 0 -- THIS FIXES IT: Tracks the accumulation of the curve
    local segment_speed_modifier = 0.02 -- Controls how sharply the track curves toward the camera

    for y = horizon, SCREEN_HEIGHT do
        -- Perspective projection factors (0 at horizon, 1 at bottom of screen)
        local perspective = (y - horizon) / (SCREEN_HEIGHT - horizon)
        local current_width = road_w * perspective
        
        -- Map the screen line to a distance unit down the track
        -- The inverse of perspective makes lines closer to the horizon project further out
        local line_projected_distance = (1 / (perspective + 0.01)) * 10 
        
        -- Get the track piece's curve data at this specific projected distance
        local line_curve = self:getCurveAtPosition(self.track_position + line_projected_distance)
        
        -- CRITICAL FIX: Add the curve of this line to our total accumulated bend
        current_curve = current_curve + (line_curve * segment_speed_modifier * perspective)
        
        -- Center point shifts based on the accumulated curve and the player's steering inputs
        local screen_center_x = (SCREEN_WIDTH / 2) + current_curve - (self.player_x * perspective * 200)
        
        -- Alternate lane line colors for a scrolling effect
        local color_toggle = math.floor((self.track_position + (SCREEN_HEIGHT - y)) / 30) % 2 == 0
        if color_toggle then
            love.graphics.setColor(0, 0, 0) -- Dark grey asphalt
        else
            love.graphics.setColor(0.05, 0.05, 0.05) -- Light grey asphalt
        end
        
        -- Draw a horizontal slice of the road
        love.graphics.rectangle("fill", screen_center_x - current_width/2, y, current_width, 1)
        
        -- Optional: Draw green grass borders on the sides of the road strip
        love.graphics.setColor(0, 0, 0.5)
        --if color_toggle then love.graphics.setColor(0, 0, 0.05) end
        love.graphics.rectangle("fill", 0, y, screen_center_x - current_width/2, 1) -- Left side
        love.graphics.rectangle("fill", screen_center_x + current_width/2, y, SCREEN_WIDTH - (screen_center_x + current_width/2), 1) -- Right side
    end
    
    -- 3. Draw HUD and static Dashboard on top (UI layer)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.dashboard_sprite, 0, 0)
    
    super.draw(self)
end

function Racing:getCurveAtPosition(position)
    local accumulated_length = 0
    
    -- Loop through each segment of your track list
    for _, segment in ipairs(self.track) do
        accumulated_length = accumulated_length + segment.length
        
        -- If the position we are looking at falls inside this segment
        if position <= accumulated_length then
            return segment.curve
        end
    end
    
    return 0 -- Default to a straight road if we reach the end of the track data
end

function Racing:update()
    -- Accelerate and brake
    if Input.down("confirm") then -- Usually mapped to Z/Enter
        self.speed = math.min(self.speed + DTMULT, self.max_speed)
    else
        self.speed = math.max(self.speed - DTMULT * 0.5, 0)
    end

    -- Steering
    if Input.down("left") then
        self.player_x = self.player_x - 0.05 * DTMULT
    elseif Input.down("right") then
        self.player_x = self.player_x + 0.05 * DTMULT
    end
    
    if Input.down("cancel") then
        self:remove()
        Assets.playSound("item")
        Game.lock_movement = false
    end
    
    -- Advance track progression
    self.track_position = self.track_position + self.speed * DTMULT
    
    super.update(self)
end

return Racing