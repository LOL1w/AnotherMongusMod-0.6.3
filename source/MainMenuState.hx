package;

import flixel.addons.transition.TransitionData;
import flixel.input.mouse.FlxMouseEventManager;
import Discord.DiscordClient;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import options.OptionsState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.system.System;
import editors.MasterEditorMenu;

using StringTools;

class MainMenuState extends MusicBeatState
{
    public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC

    var tabletPortrait:FlxSprite;
    var storymode:FlxSprite;
    var freeplay:FlxSprite;
    var credits:FlxSprite;
    var settings:FlxSprite;

    var placeholdermainmenu:FlxSprite;

    override public function create():Void
    {    
        var spriteSizes:Float = 0.5;

        FlxG.mouse.visible = true;

        //transIn = FlxTransitionableState.defaultTransIn;
       // transOut = FlxTransitionableState.defaultTransOut;

       placeholdermainmenu = new FlxSprite();
       placeholdermainmenu.loadGraphic('assets/images/placeholdermainmenu.png');
       placeholdermainmenu.screenCenter();
       add(placeholdermainmenu);

       tabletPortrait = new FlxSprite(46, 110);
       tabletPortrait.loadGraphic('assets/images/mainmenu/tablet.png');
       add(tabletPortrait);
       tabletPortrait.scale.set(spriteSizes, spriteSizes);
       tabletPortrait.updateHitbox();

        storymode = new FlxSprite(77, 177);
        storymode.loadGraphic('assets/images/mainmenu/Storymode.png');
        add(storymode);
        storymode.scale.set(spriteSizes, spriteSizes);
        storymode.updateHitbox();

        freeplay = new FlxSprite(storymode.x, storymode.y + 106);
        freeplay.loadGraphic('assets/images/mainmenu/freeplay.png');
        add(freeplay);
        freeplay.scale.set(spriteSizes, spriteSizes);
        freeplay.updateHitbox();

        credits = new FlxSprite(storymode.x, freeplay.y + 106);
        credits.loadGraphic('assets/images/mainmenu/credits.png');
        add(credits);
        credits.scale.set(spriteSizes, spriteSizes);
        credits.updateHitbox();

        settings = new FlxSprite(storymode.x, credits.y + 106);
        settings.loadGraphic('assets/images/mainmenu/settings.png');
        add(settings);
        settings.scale.set(spriteSizes, spriteSizes);
        settings.updateHitbox();

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Another Amongus Mod' V1", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(storymode))
            {
                FlxG.sound.play('assets/sounds/confirmMenu.ogg');

                MusicBeatState.switchState(new StoryMenuState());
            }

        else if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(freeplay))
            {
                FlxG.sound.play('assets/sounds/confirmMenu.ogg');

                MusicBeatState.switchState(new FreeplayState());
            }

        else if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(credits))
            {

                FlxG.sound.play('assets/sounds/confirmMenu.ogg');

                MusicBeatState.switchState(new CreditsState());
            }

        else if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(settings))
            {
                LoadingState.loadAndSwitchState(new options.OptionsState());

                FlxG.sound.play('assets/sounds/confirmMenu.ogg');
            }

        else if (FlxG.keys.justPressed.SEVEN)
            {
                MusicBeatState.switchState(new MasterEditorMenu());
            }
            
        else if (FlxG.keys.justPressed.ESCAPE)
            {
                FlxG.switchState(new TitleState());
            }
        
        /*
        if (FlxG.keys.justPressed.F4)
            {
                System.exit(0);
            }
        */

        //trace(freeplay.y);
        super.update(elapsed);
    }

}
