$fn=128;

xsquares = 3;
ysquares = 8;
square_size = 20;
first_layer_height = .2;
board_height = 5;
connecter_height = 2.5;

thing = "connecter"; // connecter, squares, or back

pxedge=false;
pyedge=false;
nxedge=true;
nyedge=false;

module grid(gridx, gridy, sizex, sizey, height) {
    for (i = [0:gridx-1]) {
        for (j = [0:gridy-1]) {
            if ( (i+j) % 2 == 0) {
                translate([sizex*i,sizey*j,0])cube([sizex,sizey,height]);
            }
        }
    }
}

module connecter() {
    translate([0,0,connecter_height/2])cube([15,5,connecter_height],center=true);
    translate([ 7.5,0,0])cylinder(r=5,h=connecter_height);
    translate([-7.5,0,0])cylinder(r=5,h=connecter_height);
}
if (thing == "back") {
difference() {
    cube([xsquares*square_size,ysquares*square_size,board_height]);
    grid(xsquares,ysquares,square_size,square_size,first_layer_height);
    if (nxedge) {
        translate([0,3/2*square_size,3])
        connecter();
        translate([0,(ysquares-3/2)*square_size,3])
        connecter();
    }
    if (pxedge) {
        translate([xsquares*square_size,3/2*square_size,3])
        connecter();
        translate([xsquares*square_size,(ysquares-3/2)*square_size,3])
        connecter();
    }
    if (nyedge) {
        translate([3/2*square_size,0,3])
        rotate([0,0,90])
        connecter();
        translate([(xsquares-3/2)*square_size,0,3])
        rotate([0,0,90])
        connecter();
    }
    if (pyedge) {
        translate([3/2*square_size,ysquares*square_size,3])
        rotate([0,0,90])
        connecter();
        translate([(xsquares-3/2)*square_size,ysquares*square_size,3])
        rotate([0,0,90])
        connecter();
    }
}
}
if (thing == "squares") {
    union() {
        grid(xsquares,ysquares,square_size,square_size,first_layer_height);
    }
}
if (thing == "connecter") {
    connecter();
}