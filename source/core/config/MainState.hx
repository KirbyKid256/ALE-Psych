package core.config;

import flixel.FlxState;

import core.Main;

class MainState extends FlxState
{
	@:unreflective static var showedModMenu:Bool = #if mobile false #else true #end;

	override public function create()
	{
		super.create();

		Main.postResetConfig();
		
		FlxTimer.wait(0.0001, () -> {
			if (showedModMenu || Paths.UNIQUE_MOD != null)
			{
				CoolUtil.switchState(new CustomState(CoolVars.data.initialState), true, true);
			} else {
				showedModMenu = true;

				CoolUtil.openSubState(new funkin.substates.ModsMenuSubState());
			}
		});
	}
}