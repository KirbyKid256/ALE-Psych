package core.structures;

import core.enums.SpriteType;

typedef ALEIcon = {
    var textures:Array<String>;
    var type:SpriteType;
    var animations:Array<ALEIconAnimation>;
    var scale:Point;
    var bopScale:Point;
    var bopModulo:Int;
    var lerp:Float;
    var format:String;
    var flipX:Bool;
    var flipY:Bool;
    var offset:Point;
    var antialiasing:Bool;
    @:optional var frames:Int;
}