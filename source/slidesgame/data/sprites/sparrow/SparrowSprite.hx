package slidesgame.data.sprites.sparrow;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class SparrowSprite extends FlxSprite
{

        public var data:SparrowSpriteData;
        public var offsets:Map<String, Array<Float>> = [];

        public var animationName:String = "";

        override public function new(id:String = "default", ?folder:String, ?X:Float, ?Y:Float) {
                super(X,Y);

                data = new SparrowSpriteData(id, folder);

                this.frames = FlxAtlasFrames.fromSparrow(Paths.getImageFile(data.imageName, "ui"), StringTools.replace(Paths.getImageFile(data.imageName, "ui"), ".png", ".xml"));
                
                for (animation in data.animations)
                {
                        this.animation.addByPrefix(animation.name, animation.symbolname, animation.frameRate, animation.looped);

                        offsets.set(animation.name, animation.offsets);
                }
                
        }

        public function playAnimation(name:String, force:Bool = false):Void
        {
                if (!offsets.exists(name)) return;

                animationName = name;
                this.animation.play(name, force);

                this.updateHitbox();
                this.offset.set(
                        offsets.get(name)[0],
                        offsets.get(name)[1]
                );
        }
}