package;

import com.asliceofcrazypie.flash.TilesheetStage3D;
import flash.display3D.Context3DRenderMode;
import openfl.Assets;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;

/**
 * @author Joshua Granick
 * @author Philippe Elsass
 */
class BunnyMark extends Sprite 
{
	private var bg:Background;
	private var fps:FPS;

	function new()
	{
		super ();
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

	function addedToStage(e) 
	{
		#if flash11
		TilesheetStage3D.init(stage, 0, 5, init, Context3DRenderMode.AUTO);
		#else
		init();
		#end
	}
	
	function init(?result:String):Void
	{
		Env.setup();
		stage.addEventListener(Event.RESIZE, resize);

		//bg = new Background();
		//bg.texture = Assets.getBitmapData("assets/grass.png");
		//bg.cols = 8;
		//bg.rows = 12;
		//bg.x = -50;
		//bg.y = -50;
		//bg.setSize(Env.width + 100, Env.height + 100);
		//addChild(bg);

		addChild (new TileTest ());

		fps = new FPS();
		addChild(fps);
		fps.addEventListener(MouseEvent.CLICK, toggleFPS);
	}

	function resize(e) 
	{
		if (bg == null) return;

		if (Env.width > Env.height)
		{
			bg.cols = 12;
			bg.rows = 8;
		}
		else
		{
			bg.cols = 8;
			bg.rows = 12;
		}
		bg.setSize(Env.width + 100, Env.height + 100);
	}

	function toggleFPS(e)
	{
		stage.frameRate = 90 - stage.frameRate;
	}

	// entry point
	public static function main()
	{
		#if iphone
		haxe.Timer.delay(create, 10);
		#else
		create();
		#end
	}

	private static function create()
	{
		Lib.current.addChild (new BunnyMark());
	}
	
	
}
