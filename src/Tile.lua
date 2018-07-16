--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.shiny = math.random() > SHINY_TILE and true or false
    
    if self.shiny then
        print(x, y)
    end

    self.shinyTable = { timer = nil,  factor = 255 } 
end

function Tile:render(x, y)

    -- draw shadow
    --love.graphics.setColor(34, 32, 52, 255)
    --love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
    --    self.x + x + 2, self.y + y + 2)
    
    if self.shiny then
        self.shinyTable.factor = 255

        --[[
        if not self.shinyTable.timer then
            self.shinyTable.timer = Timer.tween(2, {
                [self.shinyTable] = { factor = 125 }
            }):finish(function()
                Timer.tween(2, {
                    [self.shinyTable] = { factor = 255 }
                }):finish(function() 
                    self.shinyTable.timer = nil
                end)
            end)
        end
        ]]
    end
    
     -- draw tile itself
     love.graphics.setColor(0, 0, 200, 255)
     love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
         self.x + x, self.y + y)

    love.graphics.setBlendMode("alpha")

    if DEBUG then
        love.graphics.setFont(gFonts['small'])
        love.graphics.print(self.gridX .. "," .. self.gridY, self.x + x + 10, self.y + y + 10)
    end
end