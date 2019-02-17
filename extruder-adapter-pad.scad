
l = 42;
w = 42;
h = 2;

difference() {

    // base
    hull() {
       translate([4,4,0]) cylinder($fn=50, r=4,h=h);
       translate([4,w-4,0]) cylinder($fn=50, r=4,h=h);
        translate([l-4,4,0]) cylinder($fn=50, r=4,h=h);
       translate([l-4,w-4,0]) cylinder($fn=50, r=4,h=h);
    }

        translate([3.9+1.6,3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=h+2);
        translate([3.9+1.6+ 28 +3.2, 3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=h+2);
        
        translate([3.9 + 1.6, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=h+2);
        translate([3.9+1.6+ 28 +3.2, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=h+2);

    
    translate([l-w+w/2, w/2, -1])cylinder($fn=50, r=14,h=h+2);  
}
//color("red") cube([l,w,2]);
