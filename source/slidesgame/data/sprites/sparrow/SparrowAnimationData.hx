package slidesgame.data.sprites.sparrow;

class SparrowAnimationData {

        public var name:String;
        public var symbolname:String;
	@:optional
	@:default([0, 0])
        public var offsets:Array<Float>;
	@:optional
	@:default(24)
	public var frameRate:Int;
	@:optional
	@:default(false)
	public var looped:Bool;
}