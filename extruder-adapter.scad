
l = 84;
w = 42;

difference() {

    // base
    hull() {
       translate([4,4,0]) cylinder($fn=50, r=4,h=4);
       translate([4,w-4,0]) cylinder($fn=50, r=4,h=4);
        translate([l-4,4,0]) cylinder($fn=50, r=4,h=4);
       translate([l-4,w-4,0]) cylinder($fn=50, r=4,h=4);
    }

    for (i = [0,w]) {
        translate([i+ 3.9+1.6,3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=6);
        translate([i+ 3.9+1.6+ 28 +3.2, 3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=6);
        
        translate([i+ 3.9 + 1.6, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=6);
        translate([i+ 3.9+1.6+ 28 +3.2, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=6);
    }
    
    translate([l-w+w/2, w/2, -1])cylinder($fn=50, r=12,h=6);  
}
//color("red") cube([l,w,2]);
