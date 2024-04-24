package;

import flixel.FlxObject;
import flixel.addons.display.FlxBackdrop;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;
import flixel.graphics.FlxGraphic;
import WeekData;
import PlayState;

using StringTools;

class StorymodeState extends MusicBeatState
{
    var starFG:FlxBackdrop;
    var starBG:FlxBackdrop;
    var weektablet:FlxSprite;
    var songtablet:FlxSprite;
    var opponenttablet:FlxSprite;
    var opos:FlxSprite;
    var week1:FlxSprite;
    var hitbox:FlxObject;
    var selectedWeek:Bool = false;
    //var curDifficulty = '';

    override public function create():Void
        {
            #if desktop
            // Updating Discord Rich Presence
            DiscordClient.changePresence("In the Menus", null);
            #end

            FlxG.mouse.visible = true;

            starFG = new FlxBackdrop();
            starFG.loadGraphic('assets/images/starFG.png');
            starFG.velocity.set(5, 0);
            starFG.antialiasing = ClientPrefs.globalAntialiasing;
            add(starFG);
     
            starBG = new FlxBackdrop();
            starBG.loadGraphic('assets/images/starBG.png');
            starBG.velocity.set(3, 0);
            starBG.antialiasing = ClientPrefs.globalAntialiasing;
            add(starBG);

            weektablet = new FlxSprite(28, 56);
            weektablet.loadGraphic('assets/images/storymode/weektablet.png');
            add(weektablet);

            week1 = new FlxSprite(76, 99);
            week1.loadGraphic('assets/images/storymode/week1.png');
            add(week1);

            songtablet = new FlxSprite(767, 54);
            songtablet.loadGraphic('assets/images/storymode/songtablet.png');
            add(songtablet);

            opponenttablet = new FlxSprite(780, 262);
            opponenttablet.loadGraphic('assets/images/storymode/opponenttablet.png');
            add(opponenttablet);

            opos = new FlxSprite(869, 371);
            opos.loadGraphic('assets/images/storymode/opos.png');
            add(opos);

            hitbox = new FlxObject(week1.x, week1.y, week1.width, week1.height);
            add(hitbox);

            super.create();
        }

        
    override public function update(elapsed:Float):Void
        {
            //trace(opos.x, opos.y);
                
            if (FlxG.keys.justPressed.ESCAPE)
                {
                    MusicBeatState.switchState(new MainMenuState());
                }

            if (FlxG.mouse.justPressed)
                {
                        trace('clicked bitch');

                        PlayState.storyPlaylist = ['taskwork'];
                        PlayState.isStoryMode = true;
                        PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-hard', PlayState.storyPlaylist[0].toLowerCase());
                        PlayState.campaignScore = 0;
                        PlayState.campaignMisses = 0;
                        LoadingState.loadAndSwitchState(new PlayState(), true);
                        FreeplayState.destroyFreeplayVocals();
                }

                trace(selectedWeek);

                super.update(elapsed);
        }
}
