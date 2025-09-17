package slidesgame.data.sprites.sparrow;

import json2object.JsonParser;

class SparrowSpriteData
{
        public var imageName:String;

        public var animations:Array<SparrowAnimationData>;
        
        @:jignored
	public var id:String;

	public function new(id:String, ?folder:String):Void
	{
		var parser = new JsonParser<SparrowSpriteData>();

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
					trace("SparrowSpriteData unknown parsing error: " + e);
			}
		}
		if (json == null)
		{
			throw "Could not parse data for SparrowSprite: " + id + " (path: " + jsonPath + ")";
		}

		this.id = id;

		this.imageName = json.imageName;
		this.animations = json.animations;
        }
        
}