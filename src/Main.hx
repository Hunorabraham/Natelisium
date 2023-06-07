<<<<<<< HEAD
import h2d.Bitmap;

var vel = [0.,0.];
var win = hxd.Window.getInstance();
var isgrounded = false;
var ground = 0.;
var speed = 1.;
=======
import hxd.res.Sound;
import hxd.res.Loader;

>>>>>>> 1fe4f90bcaa083a8e7c6ababcb19b199306d9379
class Main extends hxd.App {
    var bmp : h2d.Bitmap;
    var yip:Sound = null;

    override function init() {
        hxd.Res.initLocal();
        // allocate a Texture with red color and creates a 100x100 Tile from it
        var tile = hxd.Res.img.Riv.toTile();
        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        tile.dx = tile.width/-2;
        tile.dy = tile.height/-2;
        bmp = new h2d.Bitmap(tile, s2d);
        // modify the display position of the Bitmap sprite
        bmp.x = s2d.width/2;
        bmp.y = s2d.height/2;
        ground = s2d.height-tile.height/2;
        function onEvent(event : hxd.Event) {
            switch(event.kind) {
                case EKeyDown: trace('DOWN keyCode: ${event.keyCode}, charCode: ${event.charCode}');
                case EKeyUp: trace('UP keyCode: ${event.keyCode}, charCode: ${event.charCode}');
                case _:
            }
        }
        hxd.Window.getInstance().addEventTarget(onEvent);
    }
    // on each frame
    override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        vel[0] = 0;
        if(hxd.Key.isPressed(16)){
            speed *= 2;
        }
        if(hxd.Key.isReleased(16)){
            speed *= 0.5;
        }
        if(hxd.Key.isDown(65)){
            vel[0] -= speed;
        }
        if(hxd.Key.isDown(68)){
            vel[0] += speed;
        }
        if(!isgrounded){
            vel[1] += 0.05;
        }else if(hxd.Key.isDown(hxd.Key.SPACE)){
            vel[1] -= 2.5;
            hxd.Res.sfx.yippee.play();
            isgrounded = false;
        }
        if(bmp.y > ground&&!isgrounded){
            trace(ground);
            bmp.y = ground;
            vel[1] = 0;
            isgrounded = true;
        }
        bmp.x += vel[0];
        bmp.y += vel[1];
    }
    static function main() {
        new Main();
    }
}