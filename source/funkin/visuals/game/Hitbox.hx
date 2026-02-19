package funkin.visuals.game;

import flixel.input.keyboard.FlxKey;

import core.interfaces.ITactileButton;

class Hitbox extends FlxSprite implements ITactileButton
{
    public var onPress:Void -> Void;
    public var onRelease:Void -> Void;

    public final keys:Array<FlxKey> = null;

    public function new(strums:Int, index:Int, keys:Array<FlxKey>, onPress:Void -> Void, onRelease:Void -> Void)
    {
        super();

        this.keys = keys;

        final hitboxWidth:Float = FlxG.width / strums;

        makeGraphic(Math.floor(hitboxWidth), FlxG.height);

        x = index * hitboxWidth;

        alpha = 0;

        this.onPress = onPress;
        this.onRelease = onRelease;
    }
    
    public var pressed:Bool = false;
    public var justPressed:Bool = false;
    public var justReleased:Bool = false;

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (justPressed)
            justPressed = false;

        if (justReleased)
            justReleased = false;

        var isOverlaped:Bool = false;

        #if mobile
        for (touch in FlxG.touches.list)
        {
            if (touch.overlaps(this, cameras[0]) && touch.pressed)
            {
                isOverlaped = true;
                
                break;
            }
        }
        #else
        isOverlaped = Controls.MOUSE && FlxG.mouse.overlaps(this, cameras[0]);
        #end

        if (!pressed && isOverlaped)
        {
            pressed = true;

            justPressed = true;

            alpha = 0.025;

            onPress();
        } else if (pressed && !isOverlaped) {
            pressed = false;

            justReleased = true;

            alpha = 0;

            onRelease();
        }
    }
    
    public function restart()
    {
        pressed = justPressed = justReleased = false;
        
        alpha = 0;
    }
}