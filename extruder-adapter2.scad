
l = 42;
w = 42;

module plate() {

    difference() {

        // base
        hull() {
           translate([4,4,0]) cylinder($fn=50, r=4,h=4);
           translate([4,w-4,0]) cylinder($fn=50, r=4,h=4);
            translate([l-4,0,0]) cube([4,4,4]); //translate([l-4,4,0]) cylinder($fn=50, r=4,h=4);
           //translate([l-4,w-4,0]) cylinder($fn=50, r=4,h=4);
            translate([l-4,w-4,0]) cube([4,4,4]);
        }

        translate([3.9+1.6,3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=6);
        translate([3.9+1.6+ 28 +3.2, 3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=6);
        
        translate([3.9 + 1.6, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=6);
        translate([3.9+1.6+ 28 +3.2, w-3.9-1.6, -1]) cylinder($fn=50, r=1.6,h=6);  
       
    }
}
//color("red") cube([l,w,2]);

diff = 30;

// platform one
plate();

// platform two containing hole in the center
translate([2*w+4,0,diff+4]) difference() {
   rotate([0,180,0]) plate();
   translate([-w/2, w/2, -5])cylinder($fn=50, r=12,h=6);  
}
translate([w,0,0]) cube([4,w,diff+4]);

// support on the left from left to right
hull() {
    translate([0,w/2-4,4]) cube([4,8,4]);
    translate([w-4,w/2-4,0]) cube([4,8,4]);
    translate([w-4,w/2-4,diff]) cube([4,8,4]);
}

// support from on the left from front to back
hull() {
    translate([w/2-4, 0, 4]) cube([8,4,4]);
    translate([w/2-4, w-4, 4]) cube([8,4,4]);
    translate([w/2-4, w/2-4, diff/3+4]) cube([8,8,4]);
}