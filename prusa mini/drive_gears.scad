include <configuration.scad>
use <herringbone_gears.scad>
use <functions.scad>

//gear variables

motor_shaft_rad = 6/2+.2;
motor_shaft_d = 4.8;

drive_shaft_rad = 25.4*(5/16)/2+.2;

small_teeth = 19;
big_teeth = 17;
gear_thick = 17;
distance_between_axles = 40;

cone_distance_1=1000;
cone_distance_2=80;
pressure_angle=30;
clearance = .25;
backlash = .25;   

circular_pitch = 360*distance_between_axles/(small_teeth+big_teeth);

part = 3;

if(part == 1){
   mirror([0,0,1]) motor_drive_gear();
}

if(part == 2){
    mirror([0,0,1]) roller_drive_gear();
    %cylinder(r=21, h=1, center=true);
}

if(part == 3){
    shaft_clamp();
}

if(part == 100){
    assembled();
}

module assembled(){
    difference(){
        union(){
            render() mirror([0,0,1]) motor_drive_gear();
            render() mirror([0,0,1]) roller_drive_gear();
        }
        //translate([0,100,0]) cube([200,200,200], center=true);
    }
}

module motor_drive_gear(){
    outer_radius = gear_outer_radius(small_teeth, circular_pitch);
    motor_offset = 6+12; //distance to move gear away from the motor
    d_offset = 3.25;
    
    translate([distance_between_axles+1,0,0]) rotate([0,0,360/small_teeth])
        difference(){
            union(){
                rotate([0,0,0]) chamfered_herring_gear(height=gear_thick, number_of_teeth=small_teeth, circular_pitch=circular_pitch, teeth_twist=0, pressure_angle=pressure_angle, cone_distance_1=cone_distance_1, cone_distance_2=cone_distance_2,clearance = clearance, backlash = backlash);
                //raised center
                translate([0,0,-motor_offset]) cylinder(r=motor_shaft_rad+5, h=gear_thick+motor_offset);
            }
            
            //D-shaft
            translate([0,0,-motor_offset-.1]) union(){
                intersection(){
                    cylinder(r=motor_shaft_rad, h=gear_thick+motor_offset+1);
                    translate([0,(motor_shaft_rad*2-motor_shaft_d)/2,0]) cube([motor_shaft_rad*2, motor_shaft_d, gear_thick*6], center=true);
                }
                cylinder(r=motor_shaft_rad, h=d_offset);
            }
            
            //set screws hole on the D shaft
            for(i=[gear_thick/2, -motor_offset/2]){
                translate([0,0,i]) rotate([90,0,0]) {
                    cylinder(r=1.6, h=50);
                    translate([0,0,8]) cylinder(r=6/2, h=25);
                    
                    
                    
                }
            }
            
            //extend the square nuts
            translate([0,-4,gear_thick/2])
            rotate([90,0,0]) hull(){
                cube([6,6,3], center=true);
                translate([0,gear_thick,0]) cube([6,6,3], center=true);
            }
            translate([0,-4,-motor_offset/2])
            rotate([90,0,0]) hull(){
                cube([6,6,3], center=true);
                translate([0,-gear_thick,0]) cube([6,6,3], center=true);
            }
            
            
            //speed holes
            translate([0,0,gear_thick/2]) difference(){
                //hollow most of the gear
                cylinder(r=outer_radius-7, h=gear_thick+1, center=true);
            
                //but leave the middle for attachments
                difference(){
                    cylinder(r=motor_shaft_rad+5, h=gear_thick+2, center=true);
                }
                for(i=[30:120:359]) rotate([0,0,i]) difference(){
                    translate([(outer_radius-5)/2,0,0]) cylinder(r=(outer_radius-6)/2,h=gear_thick+1, center=true);
                    translate([(outer_radius-4+8-2.5-2)/2,0,0]) cylinder(r=(outer_radius-5-8)/2,h=gear_thick+1.5, center=true);
                }
            }
        }
}

module shaft_clamp(){
    difference(){
        cylinder(r=drive_shaft_rad+9, h=8);
        
        //the shaft
        translate([0,0,-.5]) cylinder(r=drive_shaft_rad, h=9);
        
        //cutout
        translate([(drive_shaft_rad+7)/2,0,0]) {
            cube([drive_shaft_rad+11,2,50], center=true);
            
            //screw and nut trap
            translate([2.5,-4,4]) {
                hull(){
                        cube([6,3,6], center=true);
                        translate([0,0,gear_thick]) cube([6,3,6], center=true);
                    }
                    translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=3.4/2, h=25);
                    translate([0,8,0]) rotate([-90,0,0]) cylinder(r=6/2, h=25);
                }
        }
    }
}

module roller_drive_gear(wall = 3){
    %rotate([0,0,180]) motor_drive_gear();
    
    gear_offset = 8;
    
    radius = gear_radius(big_teeth, circular_pitch);
    outer_radius = gear_outer_radius(big_teeth, circular_pitch);
    
    gear_chamfer_radius = (outer_radius - radius) / tan(45);
    
    lift = gear_thick+1;
    
    difference(){
        union(){
            //gear
            chamfered_herring_gear(height=gear_thick, number_of_teeth=big_teeth, circular_pitch=circular_pitch, teeth_twist=0, pressure_angle=pressure_angle, cone_distance_1=cone_distance_2, cone_distance_2=cone_distance_1,clearance = clearance, backlash = backlash);
            //raised center
            translate([0,0,-gear_offset]) cylinder(r=drive_shaft_rad+4, h=gear_thick+gear_offset);
        }
        
        //the shaft
        translate([0,0,-.5-gear_offset]) cylinder(r=drive_shaft_rad, h=gear_thick+1+gear_offset);
        
        //clamping system
        rotate([0,0,7]) translate([0,0,-.5]) {
            //cutout a clamp segment
            translate([(drive_shaft_rad+8)/2,0,0]) cube([drive_shaft_rad+8,2,50], center=true);
            intersection(){
                difference(){
                    cylinder(r=drive_shaft_rad+8, h=gear_thick+1);
                    translate([0,0,-.5]) cylinder(r=drive_shaft_rad+7, h=gear_thick+2);
                }
                union(){
                    translate([0,25,0]) cube([50,50,50], center=true);
                }
            }
            
            //this makes it look more like a pokeball.
           translate([-(drive_shaft_rad+8)/2,0,gear_thick+.5]) cube([drive_shaft_rad+8,1,1], center=true);
            translate([0,0,gear_thick]) difference(){
                cylinder(r=drive_shaft_rad+8, h=gear_thick+1);
                translate([0,0,-.5]) cylinder(r=drive_shaft_rad+7, h=gear_thick+2);
            }
                
                
            
            
            //screwhole & nut trap
            translate([drive_shaft_rad+3.5,-5,gear_thick/2+.5]) {
                hull(){
                    cube([6,3,6], center=true);
                    translate([0,0,gear_thick]) cube([6,3,6], center=true);
                }
                translate([0,-5,0]) rotate([-90,0,0]) cylinder(r=3.4/2, h=25);
                translate([0,8,0]) rotate([-90,0,0]) cylinder(r=6/2, h=25);
            }
        }
        
    }
}
