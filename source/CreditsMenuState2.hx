package;

import openfl.filters.ShaderFilter;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.transition.FlxTransitionableState;
import flash.display.BlendMode;
import openfl.display.BlendMode;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class CreditsMenuState extends MusicBeatState
{
    var background:FlxSprite;
    var tvs:FlxSprite;
    var mainTv:FlxSprite;
    var fnafStatic:FlxSprite;
    var pershader:ShaderFilter;

    var names:FlxText;
    var icons:FlxSprite;
    var rolesTxt:FlxText;

    var white:FlxSprite;
    var red:FlxSprite;

    var overlay:FlxSprite;

    override public function create():Void
        {
           //var pershader = new ShaderFilter(new Perspective());
            white = new FlxSprite();
            white.frames = Paths.getSparrowAtlas('creditsmenu/sss');
            white.animation.addByPrefix('white', 'white', 24, true);
            white.animation.play('white');
            add(white);
            //white.updateHitbox();

            overlay = new FlxSprite();
            overlay.loadGraphic('assets/images/creditsmenu/overgay.png');
            //overlay.blend = OVERLAY;
            overlay.setGraphicSize(FlxG.width, FlxG.height);
            overlay.screenCenter();
            //add(overlay);

        }

    override public function update(elapsed:Float):Void
        {
            if (FlxG.keys.anyJustPressed([ESCAPE, BACKSPACE]))
                {
                    MusicBeatState.switchState(new MainMenuState());
                }

        }
}