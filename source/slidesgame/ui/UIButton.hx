package slidesgame.ui;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import slidesgame.data.ui.buttons.ButtonSparrowSpriteData;

class UIButton extends FlxSprite
{
        public var data:ButtonSparrowSpriteData;

        override public function new(id:String = "UI_buttons", ?X:Float, ?Y:Float) {
                super(X,Y);

                data = new ButtonSparrowSpriteData(id, "ui");

                this.frames = FlxAtlasFrames.fromSparrow(Paths.getImageFile(data.imageName, "ui"), StringTools.replace(Paths.getImageFile(data.imageName, "ui"), ".png", ".xml"));
                
                for (animation in data.animations)
                {
                        this.animation.addByPrefix(animation.name, animation.symbolname, animation.frameRate, animation.looped);
                }
        }
}