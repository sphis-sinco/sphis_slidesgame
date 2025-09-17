package slidesgame.data.ui.buttons;

import json2object.JsonParser;
import slidesgame.data.sprites.sparrow.SparrowSpriteData;

class ButtonSparrowSpriteData extends SparrowSpriteData
{
        public var button:ButtonStateData;

        override public function new(id:String, ?folder:String)
        {
                super();

		var parser = new JsonParser<ButtonSparrowSpriteData>();

		final jsonPath = Paths.getDataFile(id + ".json", folder);
		var json = parser.fromJson(Paths.getText(jsonPath), jsonPath);

		for (e in parser.errors)
		{
			switch (e)
			{
				case IncorrectType(variable, expected, pos):
					trace("IncorrectType(" + variable + ", expected: " + expected + ", pos: " + pos + ")");
				case UninitializedVariable(variable, pos):
					trace("IncorrectType(variable: " + variable + ", pos: " + pos + ")");
				case UnknownVariable(variable, pos):
					trace("UnknownVariable(variable: " + variable + ", pos: " + pos + ")");
				default:
					trace("ButtonSparrowSpriteData unknown parsing error: " + e);
			}
		}
		if (json == null)
		{
			throw "Could not parse data for ButtonSparrowSprite: " + id + " (path: " + jsonPath + ")";
		}

		this.id = id;

		this.imageName = json.imageName;
		this.animations = json.animations;

		this.button = json.button;
        }
        
}