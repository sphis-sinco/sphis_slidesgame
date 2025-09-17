package slidesgame;

import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		FlxG.switchState(() -> new slidesgame.ui.title.TitleScreen());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
