local x = -150
local y = 0
local size = 0.6

function onCreate()
	makeLuaSprite("back", "stages/encounter/back", x, y)
	scaleObject("back", size, size)
	addLuaSprite("back", false)

	makeLuaSprite("bwomp", "stages/encounter/bwomp", x, y)
	scaleObject("bwomp", size, size)
	addLuaSprite("bwomp", false)

	makeLuaSprite("ground", "stages/encounter/ground", x, y)
	scaleObject("ground", size, size)
	addLuaSprite("ground", false)

	makeLuaSprite("CU", "stages/encounter/CU", x, y)
	scaleObject("CU", size, size)
	addLuaSprite("CU", false)

	makeLuaSprite("ululu", "stages/encounter/ululu", x, y)
	scaleObject("ululu", size, size)
	addLuaSprite("ululu", true)
end


function onCreatePost()
	setProperty("gf.visible", false)
end