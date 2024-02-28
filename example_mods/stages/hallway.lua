local x = -150
local y = 0

function onCreate()
	makeLuaSprite("bg", "stages/Ground", x, y)
	scaleObject("bg", 0.5, 0.5)
	addLuaSprite("bg", false)

	makeLuaSprite("wotah", "stages/Water_", x, y)
	scaleObject("wotah", 0.5, 0.5)
	addLuaSprite("wotah", false)

	makeLuaSprite("Tasks", "stages/Tasksthings", x, y)
	scaleObject("Tasks", 0.5, 0.5)
	addLuaSprite("Tasks", false)

	makeLuaSprite("painting", "stages/Apaintingofafamiliarguy", x, y)
	scaleObject("painting", 0.5, 0.5)
	addLuaSprite("painting", false)

	makeLuaSprite("plants", "stages/Plants", x, y)
	scaleObject("plants", 0.5, 0.5)
	addLuaSprite("plants", false)

	makeLuaSprite("vent", "stages/Fireinthehole", x, y)
	scaleObject("vent", 0.5, 0.5)
	addLuaSprite("vent", false)
end


function onCreatePost()
	setProperty("gf.visible", false)
end