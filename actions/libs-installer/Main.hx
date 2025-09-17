import haxe.Json;
import sys.FileSystem;
import sys.io.File;

typedef Library =
{
	var name:String;
	var type:String;
	var ?version:String;
	var ?dir:String;
	var ?ref:String;
	var ?url:String;
}

class Main
{
	public static function main():Void
	{
		if (!FileSystem.exists('.haxelib'))
			FileSystem.createDirectory('.haxelib');

		final json:Array<Library> = Json.parse(File.getContent('./hmm.json')).dependencies;
		Sys.command('haxelib setup .haxelib');

		for (lib in json)
		{
			trace('${lib.name} version: ${lib.version}');
			switch (lib.type)
			{
				case "haxelib":
					Sys.command('haxelib --skip-dependencies --always --quiet install ${lib.name} ${lib.version != null ? lib.version : ""}');
				case "git":
					Sys.command('haxelib --skip-dependencies --always --quiet git ${lib.name} ${lib.url}');
				default:
					Sys.println('Cannot resolve library of type "${lib.type}"');
			}
		}

		Sys.exit(0);
	}
}
