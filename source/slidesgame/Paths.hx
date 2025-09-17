package ontime;

import lime.utils.Assets;
#if sys
import sys.io.File;
#end

class Paths
{
	public static function getAssetsPath(path:String)
	{
		var return_path_prefix:String = "";

		if (!StringTools.startsWith(path, "assets/"))
		{
			return_path_prefix = "assets/";
		}

		return return_path_prefix + path;
	}

	public static function getDataFile(folder:String, file:String)
	{
		return getAssetsPath((folder != null ? folder + "/" : "") + "data/" + file);
	}

	public static function getImageFile(folder:String, file:String)
	{
		return getAssetsPath((folder != null ? folder + "/" : "") + "images/" + file + ".png");
	}

	public static function getText(path:String):String
	{
		#if sys
		return File.getContent(path);
		#end

		return Assets.getText(path);
	}
}
