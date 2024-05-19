package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.addons.transition.FlxTransitionableState;

using StringTools;

class CreditsMenuState extends MusicBeatState
{
    var sizeThings = 0.8;

    var white:FlxSprite;
    var red:FlxSprite;


    override public function create():Void
    {
        white = new FlxSprite(-100, 410);
        white.frames = Paths.getSparrowAtlas('creditsmenu/white');
        white.animation.addByPrefix('anim', 'white', 18, true);
        white.animation.play('anim');
        white.scale.set(sizeThings, sizeThings);

        add(white);
        white.updateHitbox();

        red = new FlxSprite(1090, white.y - 120);
        red.frames = Paths.getSparrowAtlas('creditsmenu/red');
        red.animation.addByPrefix('anim', 'red', 18, true);
        red.animation.play('anim');
        red.scale.set(sizeThings, sizeThings);

        add(red);
        red.updateHitbox();

    	super.create();
    }

    override public function update(elapsed:Float):Void
    {

        if (FlxG.keys.justPressed.ESCAPE)
            FlxG.switchState(new MainMenuState());
    	super.update(elapsed);
    }
}