local duration = 2;
local bop = false;
local anglgj = 1;
local tweenn = "quadOut";
local speeddd = 0.27;

function onCreatePost() 
-- move the yellow notes
noteTweenX('bfTween1', 4, 90, duration, 'smoothStepInOut');
noteTweenX('bfTween2', 5, 205, duration, 'smoothStepInOut');
noteTweenX('bfTween3', 6, 315, duration, 'smoothStepInOut');
noteTweenX('bfTween4', 7, 425, duration, 'smoothStepInOut');
-- move the purple notes
noteTweenX('dadTween1', 0, 9999, 0.01, 'linear');
noteTweenX('dadTween2', 1, 99995, 0.01, 'linear');
noteTweenX('dadTween3', 2, 9999, 0.01, 'linear');
noteTweenX('dadTween4', 3, 9999, 0.01, 'linear');

--setProperty('iconP1.visible', false);
--setProperty('iconP2.visible', false);
--setProperty('healthBar.visible', false);

--setProperty('scoreTxt.y', 61);
setProperty('gf.visible', false)
end


function onMoveCamera(focus)
	if focus == 'boyfriend' then
        setProperty('defaultCamZoom', 1.1)
		
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 1.3)
	end
end


function onStepHit() 

	if curStep == 127 then
		bop = true;
	end

	if curStep == 380 then
		bop = false;
	end

	if curStep == 896 then
		bop = true;
	end

	if curStep == 1160 then
		bop = false;
	end

end

function onBeatHit()

    if bop == false then
		doTweenAngle("camHUDtween", "camHUD", 0, speeddd, tweenn)
		doTweenAngle("camGametween", "camGame", 0, speeddd, tweenn)
	end

	if bop == true and curBeat % 2 == 0 then
		doTweenAngle("camHUDtween", "camHUD", anglgj *1, speeddd, tweenn)
		doTweenAngle("camGametween", "camGame", anglgj *1, speeddd, tweenn)
	end	

	if bop == true and curBeat % 2 == 1 then
		doTweenAngle("camHUDtween", "camHUD", anglgj *-1, speeddd, tweenn)
		doTweenAngle("camGametween", "camGame", anglgj *-1, speeddd, tweenn)
	end
end


function onUpdate(elapsed)
	setProperty('cameraSpeed', 2.5)
end

function onUpdatePost()
-- https://gamebanana.com/posts/10053636
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)

    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

    setProperty('iconP1.x',P1Mult - 110)

    setProperty('iconP1.origin.x',240)

    setProperty('iconP1.flipX',true)

    setProperty('iconP2.x',P2Mult + 110)

    setProperty('iconP2.origin.x',-100)

    setProperty('iconP2.flipX',true)

    setProperty('healthBar.flipX',true)

end