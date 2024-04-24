package;
import openfl.filters.ShaderFilter;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flash.display.BlendMode;
import openfl.display.BlendMode;

class CreditsMenuState extends MusicBeatState
{
    var background:FlxSprite;
    var tvs:FlxSprite;
    var mainTv:FlxSprite;
    var amonguses:FlxSprite;
    var fnafStatic:FlxSprite;
    var pershader:ShaderFilter;

    var names:FlxText;
    var icons:FlxSprite;
    var rolesTxt:FlxText;

    var overlay:FlxSprite;

    override public function create():Void
        {
            //var pershader = new ShaderFilter(new Perspective());
            amonguses = new FlxSprite();
            amonguses.frames = Paths.getSparrowAtlas('creditsmenu/amonguses');
            amonguses.animation.addByPrefix('among', 'among', 24, true);
            amonguses.animation.play('among');
            add(amonguses);
            amonguses.updateHitbox();

            overlay = new FlxSprite();
            overlay.loadGraphic('assets/images/creditsmenu/overlay.png');
            //overlay.blend = OVERLAY;
            overlay.setGraphicSize(FlxG.width, FlxG.height);
            overlay.screenCenter();
            add(overlay);

        }

    override public function update(elapsed:Float):Void
        {
            if (FlxG.keys.anyJustPressed([ESCAPE, BACKSPACE]))
                {
                    MusicBeatState.switchState(new MainMenuState());
                }

        }
}