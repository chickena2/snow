local t = {}

local options =
{
	frames =
   	{
		{ x = 0, y = 0, width = 54, height = 65 },		--1
		{ x = 56, y = 0, width = 54, height = 65  },	
		{ x = 112, y = 0, width = 54, height = 65 },
		{ x = 168, y = 0, width = 54, height = 65 },
		{ x = 224, y = 0, width = 54, height = 65 },
		{ x = 280, y = 0, width = 54, height = 63 },
		{ x = 332, y = 0, width = 54, height = 59 },	-- 7,throw 1 --
		{ x = 386, y = 4, width = 54, height = 61 },
		{ x = 440, y = 4, width = 56, height = 60 },	-- 9, throw 3 --
		{ x = 0, y = 69, width = 54, height = 58 },		-- 10, sit --
   	},
}

local imageSheet = graphics.newImageSheet("images/su_spriteSheet.png", options)

local sequenceData =
{
   	{ name="stop", frames={1}, time=500},
   	{ name="walk", frames={2,3,4,5}, time=1000, loopCount=0 }, 
   	{ name="jump", frames={6}, time=500},
   	{ name="throw", frames={7,8,9,1}, time=500, loopCount=1 }, 
   	{ name="sit", frames = {10} },
}	

local sprite = display.newSprite(imageSheet, sequenceData)
sprite.x = 392
sprite.y = 408
sprite:scale(-1,1)
sprite:setSequence("sit")
sprite:play()

local function onSpriteTouch( event )
    if event.phase == "began" or  event.phase == "moved"  then
       sprite.x = event.x 
       sprite.y = event.y	
    end
    if event.phase == "began" then
    	print(sprite.x)
    	print(sprite.y)
    end
    return true
end

sprite:addEventListener( "touch", onSpriteTouch )