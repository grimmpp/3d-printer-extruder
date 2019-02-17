
//include<extruder-adapter2.scad>

l = 42;
w = 42;

module plate(h) {

    difference() {

        // base
        hull() {
           translate([4,4,0]) cylinder($fn=50, r=4,h=h);
           translate([4,w-4,0]) cylinder($fn=50, r=4,h=h);
            translate([l-4,0,0]) cube([4,4,h]); //translate([l-4,4,0]) cylinder($fn=50, r=4,h=4);
           //translate([l-4,w-4,0]) cylinder($fn=50, r=4,h=4);
            translate([l-4,w-4,0]) cube([4,4,h]);
        }

        //front right
        translate([3.9+1.6,3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=2*h+2);
        
        //front left
        translate([3.9+1.6+ 28 +3.2, 3.9+1.6,-1]) cylinder($fn=50, r=1.6,h=2*h+2);
        translate([3.9+1.6+ 28 +3.2, 3.9+1.6,h-3]) cylinder($fn=50, d2=6.8,d1=3.2,h=3.2);
        
        //back right
        translate([3.9 + 1.6, w-3.9-1.6,-1]) cylinder($fn=50, r=1.6,h=2*h+2);
        
        // back left
        translate([3.9+1.6+ 28 +3.2, w-3.9-1.6,-1]) cylinder($fn=50, r=1.6,h=2*h+2);  
       
        //motor hole
        translate([w/2, w/2, -1]) cylinder($fn=50, d=12,h=2*height_p+2);  
    }
}

module arm(h_offSet) {
  _h = 12;
  translate([0,0,h_offSet]) difference() {
    union() {
      //color("green") 
        hull() {
        translate([3.9+1.6+ 28 +3.2, w-3.9-1.6,0]) cylinder($fn=100, r=3+3.9,h=_h);
        translate([w/2, w/2+12,0]) cylinder($fn=100, d=13,h=_h);
        translate([w-18, 25 ,0]) cube([12,2,_h]);// cylinder($fn=100, r=1.6+3.9,h=_h);  
      }
      // connection
      hull() {
        // point left front
        translate([3.9+1.6+ 28 +3.2, w-3.9-1.6,0]) cylinder($fn=100, r=3+3.9,h=_h);
        translate([3.9+1.6+ 28 +3.2, -24,0]) cylinder($fn=100, r=1.6+3.9,h=_h);
      }
      // handle at the end
      hull() {
         translate([3.9+1.6+ 28 +3.2, -24,0]) cylinder($fn=100, r=1.6+3.9,h=_h);
         translate([3.9+1.6+ 28 +3.2+6, -24,0]) cylinder($fn=100, r=1.6+3.9,h=_h);
      }
    }
    
    // back left | scrow hole
    translate([3.9+1.6+ 28 +3.2, w-3.9-1.6,-2]) cylinder($fn=100, r=1.6,h=_h+8);
    translate([3.9+1.6+ 28 +3.2, w-3.9-1.6,_h-4]) cylinder($fn=100, d=9.2,h=5);
    
    // motor hole
    //*
    translate([w/2, w/2, -1]) cylinder($fn=100, d=11.4, h=_h+8);
//translate([w/2+2.4, w/2+2.5, -1]) cylinder($fn=100, d=4, h=_h+8);
    //translate([w/2+4.2, w/2-10, -1]) cube([6,9,_h+8]);
    //translate([w/2-6, w/2, -1]) cube([8,6,_h+8]);
    //*/
    /*
    translate([w/2, w/2-4.2, -1]) cylinder($fn=100, d=20.4, h=_h+6);
    translate([w/2+4.2, w/2-11, -1]) cube([6,6,_h+8]);
    translate([w/2-6, w/2, -1]) cube([6,6,_h+8]);
    //*/
    
    // ball bearing
    translate([w/2, w/2+12, 0]) cylinder($fn=100, d=4, h=_h+8);
    translate([w/2, w/2+12, -1]) cylinder($fn=6, d=8.2,h=4);
    difference(){
        translate([w/2, w/2+12, _h/2-5.4/2]) cylinder($fn=100, d=13.8, h=5.4);
        translate([w/2, w/2+12, _h/2-2.7]) cylinder($fn=100, d=7, h=0.7);
        translate([w/2, w/2+12, _h/2+2] ) cylinder($fn=100, d=7, h=0.7);
    }
    
    //spring support
    translate([w/2, -6,_h/2]) rotate([0,90,0]) cylinder($fn=100, r=1.6,h=w);
    translate([w-12, -6,_h/2]) rotate([0,90,0]) cylinder($fn=100, d=9,h=4);
    translate([w-8.5, -6,_h/2]) rotate([30,0,0]) rotate([0,90,0]) cylinder($fn=6, d=6.6,h=3);
    
    //filament hole
    translate([-w/2, w-15.4, _h/2]) rotate([0,90,0]) cylinder($fn=100, d=2.2,h=2*w);
    translate([w-4, w-15.4, _h/2]) rotate([0,90,0]) cylinder($fn=100, d1=2.2,d2=3.4,h=6);
  }
  //translate([0,0,h_offSet]) 
    //translate([w-4, w-15.4, _h/2]) rotate([0,90,0]) cylinder($fn=100, d1=2,,d2=4,h=4);
}

module motor() {
  translate([w/2,w/2,0]) cylinder($fn=50, d=11, h=20); 
  
  hull() {
    translate([2,2,-40]) cylinder($fn=50, d=4,h= 40); 
    translate([w-2,2,-40]) cylinder($fn=50, d=4,h= 40); 
    translate([2,w-2,-40]) cylinder($fn=50, d=4,h= 40); 
    translate([w-2,w-2,-40]) cylinder($fn=50, d=4,h= 40); 
  }
}

module staticArm(h_offSet) {
  _h = 12;
    translate([0,0,h_offSet]) difference() {
      union() {
        _h2=_h+h_offSet;
        //arm
        hull() {
           translate([4,4 -50,-h_offSet]) cylinder($fn=100, r=4,h=_h2);
           translate([4,w-4,-h_offSet]) cylinder($fn=100, r=4,h=_h2);
            
           translate([4+6,4 -50,-h_offSet]) cylinder($fn=100, r=4,h=_h2);
           translate([4+6,w-4,-h_offSet]) cylinder($fn=100, r=4,h=_h2);
        }
        
        // next to motor hole
        hull() {
            translate([w/2-10, w-15.4-1,0]) cube([10,1,_h]);
            translate([w/2-10, w-5.4-1,0]) cube([1,1,_h]);
            translate([w/2-10, w-25.4-1,0]) cube([1,1,_h]);
        }
        
        //connection
        hull() {
          translate([w/2-7, 12,-h_offSet]) cube([11,12,_h2]);
          translate([w/2-8, -20,-h_offSet]) cube([1,1,_h2]);
        }
      }
      //screw hole
      translate([3.9+1.6,3.9+1.6,-_h]) cylinder($fn=50, r=1.6,h=2*_h+2);
      translate([3.9 + 1.6, w-3.9-1.6,-_h]) cylinder($fn=100, r=1.6,h=2*_h+2);
      
      //screw head hole
      translate([3.9+1.6,3.9+1.6,_h-3.2]) cylinder($fn=100, d=5.5,h=4);
      translate([3.9 + 1.6, w-3.9-1.6,_h-3.2]) cylinder($fn=50, d=5.5,h=4);
      
      //motor hole
      translate([w/2, w/2, -h_offSet-1]) cylinder($fn=100, d=12,h=_h+h_offSet+2); 
      
      //flex arm
      translate([w/2, w/2+12,-1]) cylinder($fn=100, d=13.4,h=_h+2);
      
      //filament hole
      translate([-w/2, w-15.4, _h/2]) rotate([0,90,0]) cylinder($fn=100, d=2.2,h=2*w);
      translate([-0.8, w-15.4, _h/2]) rotate([0,90,0]) cylinder($fn=100, d=5.8,h=5);
      
      //spring support
      translate([-w/2, -6,_h/2]) rotate([0,90,0]) cylinder($fn=100, d=5,h=w);
      translate([12, -6,_h/2]) rotate([0,90,0]) cylinder($fn=100, d=10,h=12);
      translate([8.4, -6,_h/2]) rotate([90,0,0]) rotate([0,90,0]) cylinder($fn=6, d=9,h=4);
      translate([-0.2, -6,_h/2]) rotate([90,0,0]) rotate([0,90,0]) cylinder($fn=6, d=9,h=4);
      
      //wire support
      translate([-1, -40,_h/2-2]) rotate([0,90,0]) cylinder($fn=100, d=10,h=16);
      translate([-1, -40-6/2,_h/2]) cube([16,6,_h]);
    }
}

module ballBearing(h_offSet) {
    _h=12;
    translate([0,0,h_offSet])  {
        translate([w/2, w/2+12, _h/2-5/2+0.5]) cylinder($fn=100, d=13, h=4);
    }
}

//color("red") cube([l,w,2]);


height_offset = 30;
height_p = 4;

/*
color("lightblue") motor();
color("lightblue") ballBearing(height_p);
//*/

//color("lightgreen") arm(height_p);
//*
staticArm(height_p);
plate(height_p);
//*/
