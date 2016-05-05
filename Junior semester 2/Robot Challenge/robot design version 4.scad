//main body
difference(){
    
    cylinder(44.45,100,100,true);
    // square hole in middle
    translate([0,0,-22.225])
        cube([130,130,44.45], true);
    //square extension
    cube([180,20,45], true);
    //another hole in the middle
    cube([110,50,45], true);
    /*hole 1 in corner
    translate([-38, -38, 0])
        cylinder(500, 12, 12, true);
    //hole 2 in corner
    translate([-38, 38, 0])
        cylinder(500, 12, 12, true);
    //hole 3 in corner
    translate([38, -38, 0])
        cylinder(500, 12, 12, true);
    //hole 4 in corner
    translate([38, 38, 0])
        cylinder(500, 12, 12, true);*/
}
//main motor left
rotate([0,90,0])
    translate([15, 0, -70])
cylinder(40.9, 8, 8, true);
//main motor right
rotate([0,90,0])
    translate([15, 0, 70])
cylinder(40.9, 8, 8, true);
/*motor turnything left
rotate([90,0,0])
    translate([0,-75, -185]) 
    cylinder(40, 10, 10, $fn=6, true);
//motor turnything right
rotate([90,0,0])
    translate([0,-75, 185]) 
    cylinder(40, 10, 10, $fn=6, true);*/
//wheel left
rotate([0, 90, 0])
    translate([15, 0, -45])
    cylinder(11.303, 19.05, 19.05, true);
//wheel left
rotate([0, 90, 0])
    translate([15, 0, 45])
    cylinder(11.303, 19.05, 19.05, true);
//caster
rotate([0, 90, 0])
    translate([15, 40, 0])
    cylinder(11.303, 19.05, 19.05, true);
//controller
    translate([0,0,44.45])
        cube([101.6,101.6,44.45], true);
//ir sensor FL
rotate([0,0,45])
translate([-5, 101, 20])
    cube([20, 5, 40], true);
//ir sensor FR
rotate([0,0,-45])
translate([5, 101, 20])
    cube([20, 5, 40], true);
//ir sensor F
translate([0, 101, 20])
    cube([20, 5, 40], true);
//ir sensor L
rotate([0, 0, 90])
    translate([0, 101, 20])
        cube([20, 5, 40], true);
//ir sensor R
rotate([0, 0, 90])
    translate([0, -101, 20])
        cube([20, 5, 40], true);
