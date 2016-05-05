//main body
difference(){
    cylinder(200,500,500,true);
    // square hole in middle
    translate([0,0,-100])
        cube([700,700,300], true);
    //hole 1 in corner
    translate([-300, -300, 0])
        cylinder(500, 40, 40, true);
    //hole 2 in corner
    translate([-300, 300, 0])
        cylinder(500, 40, 40, true);
    //hole 3 in corner
    translate([300, -300, 0])
        cylinder(500, 40, 40, true);
    //hole 4 in corner
    translate([300, 300, 0])
        cylinder(500, 40, 40, true);
}
//main motor left
rotate([90,0,0])
    translate([0, -75, -275])
    cylinder(150, 50, 50, true);
//main motor right
rotate([90,0,0])
    translate([0, -75, 275])
    cylinder(150, 50, 50, true);
//motor turnything left
rotate([90,0,0])
    translate([0,-75, -185]) 
    cylinder(40, 10, 10, $fn=6, true);
//motor turnything right
rotate([90,0,0])
    translate([0,-75, 185]) 
    cylinder(40, 10, 10, $fn=6, true);
//wheel left
rotate([90, 0, 0])
    translate([0, -50, -145])
    cylinder(75, 100, 100, true);