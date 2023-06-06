import hxd.res.Sound;
import hxd.res.Loader;

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
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;

        yip = hxd.Res.sfx.yippee;
        yip.play();

    }
    // on each frame
    override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        bmp.rotation += 0.05;
    }
    static function main() {
        new Main();
    }
}