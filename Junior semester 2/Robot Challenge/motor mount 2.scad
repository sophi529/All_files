difference(){
//outside cube
    translate([0, 0, 20])
cube([(42+3/2), 16.5, 40], true);
    //inside cube cutout
    translate([0, 0, 33])
    cube([42, (16.5-3/2), 20], true);
    //cube edge bye bye
    translate([21, 0, 23])
    cube([5, (16.5-3/2), 40], true);

    //right hole
    translate([-(42 + 3/2) /2, 5.5, 30])
        rotate([0, -90, 0])
        cylinder(r1 = 3/4, r2 = 4/2, h = 3/2, $fn = 200, center = true);
        //left hole
        translate([-(42 + 3/2) /2, -5.5, 30])
        rotate([0, -90, 0])
        cylinder(r1 = 3/4, r2 = 4/2, h = 3/2, $fn = 200, center = true);
        //center hole
        translate([-(42 + 3/2) /2, 0.0, 30])
        rotate([0, 90, 0])
        cylinder(r = 7/2, h = 3/2, $fn = 200, center = true);
}