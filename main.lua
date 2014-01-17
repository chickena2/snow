-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local background = display.newImage("images/background-sky.png")
background:scale(1,1)

local tree= display.newImage("images/brown_tree.png")
tree:scale(2,2)
tree.x = 250
tree.y = 250

local ground1 = display.newImage("images/ground1.png")
ground1.y = 500

local ground_physic = display.newImage("images/line.png")
ground_physic.y = 500
ground_physic.isVisible = false

local swing = display.newImage("images/swing.png")

swing.x = 400
swing.y = 325

local function onSwingTouch( event )
    if event.phase == "began" or  event.phase == "moved"  then
       swing.x = event.x 
       swing.y = event.y	
    end
    if event.phase == "began" then
    	print(swing.x)
    	print(swing.y)
    end
    return true
end

swing:addEventListener( "touch", onSwingTouch )

require "su"