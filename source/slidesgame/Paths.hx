package ontime;

import lime.utils.Assets;
#if sys
import sys.io.File;
#end

class Paths
{
	public static function getAssetsPath(path:String, ?folder:String)
	{
		var return_path_prefix:String = "";

		if (!StringTools.startsWith(path, "assets/"))
		{
			return_path_prefix = "assets/";
		}

		return (folder != null ? folder + "/" : "") + return_path_prefix + path;
	}

	public static function getDataFile(file:String, ?folder:String)
	{
		return getAssetsPath("data/" + file, folder);
	}

	public static function getImageFile(file:String, ?folder:String)
	{
		return getAssetsPath("images/" + file + ".png", folder);
	}

	public static function getText(path:String):String
	{
		#if sys
		return File.getContent(path);
		#end

		return Assets.getText(path);
	}
}
