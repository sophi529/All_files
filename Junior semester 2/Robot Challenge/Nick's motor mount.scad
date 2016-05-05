precision      = 70;

radial_gap     = 0.25;
cube_gap       = 0.5;

wall_thickness = 4;
/*************************************************************************************************/
/*************************************************************************************************/
/************************************* <NEW BASE MODULES/> ***************************************/
module cube_peg(length, width, height)
{
    cube(size = [length, width, height], center = true);
}
/*************************************************************************************************/
module radial_peg(radius, height)
{
    cylinder(r = radius, h = height, $fn = precision, center = true);
}
/*************************************************************************************************/
module cube_hole(length, width, height, wall)
{
    difference()
    {
        cube_peg(length + cube_gap + wall, width + cube_gap + wall, height);
        cube_peg(length + cube_gap, width + cube_gap, height);
    }
}
/*************************************************************************************************/
module radial_hole(radius, height, wall)
{
    wall = wall/2;
    difference()
    {
        radial_peg(radius + radial_gap + wall, height);
        radial_peg(radius + radial_gap, height);
    }
}
/*************************************************************************************************/
module cube_lip(length_outer, length_inner, width_outer, width_inner, height)
{
    difference()
    {
        cube(size = [length_outer, width_outer, height], center = true);
        cube(size = [length_inner, width_inner, height], center = true);
    }
}
/*************************************************************************************************/
module cube_lid(length_outer, length_inner, width_outer, width_inner, height)
{
    wall_size = 2;
    difference()
    {
        cube(size = [length_outer + wall_size, width_outer + wall_size, height], center = true);
        cube_lip(length_outer + cube_gap, length_inner - cube_gap, width_outer + cube_gap, width_inner - cube_gap, height);
    }
    translate([0, 0, -height])
    cube(size = [length_outer + wall_size, width_outer + wall_size, height], center = true);
}
/*************************************************************************************************/
module cube_cap(length_outer, width_outer, height, wall)
{
    difference()
    {
        cube_peg(length_outer + wall, width_outer + wall, height + wall);
        translate([0, 0, -wall])
        cube_peg(length_outer + cube_gap, width_outer + cube_gap, height);
    }
}
/*************************************************************************************************/
module radial_lip(radius_outer, radius_inner, height)
{
    difference()
    {
        cylinder(r = radius_outer, h = height, $fn = precision, center = true);
        cylinder(r = radius_inner, h = height, $fn = precision, center = true);
    }
}
/*************************************************************************************************/
module radial_lid(radius_lip_outer, radius_lip_inner, height)
{
    wall_radius = 2;// This is how much material is on the outside of the cap: it has nothing to do with fit.
    difference()
    {
      cylinder(r = radius_lip_outer + wall_radius, h = height, $fn = precision, center = true);
      radial_lip(radius_lip_outer + radial_gap, radius_lip_inner - radial_gap, height);
    }
    translate([0, 0, -height])
    cylinder(r = radius_lip_outer + wall_radius, h = height, $fn = precision, center = true);
}
/*************************************************************************************************/
module radial_cap(radius_peg, height, wall)
{
    difference()
    {
        cylinder(r = radius_peg + wall, h = height + wall, $fn = precision, center = true);
        translate([0, 0, wall/2])
        radial_peg(radius_peg + radial_gap, height);
    }
}
/************************************* </NEW BASE MODULES> *****************************************/
/*********************************** <NEW COMPOSITE MODULES/> **************************************/
/***************************************************************************************************/

botball_radius = 179/2;
camera_clearance = 15;
castor_offset_angle = 0;
castor_offset_radius = botball_radius - 13;
mount_offset_angle = 45;
mount_offset_radius = 70;
cutout_width = 60;
cutout_length = (botball_radius + camera_clearance) * 2;

deck_height = 5;
deck_spacing = 60;
link_footprint = 120/2;

bumper_height = 25;
bumper_thickness = 6;
bumper_top_height = 15;
bumper_bottom_height = deck_height * 2;
hole_radius = 2.5;

wheel_radius = 30;
wheel_width = 10;
wheel_allowance = 5;

motor_width = 26;
motor_length = 42;
motor_height = 20;
motor_mount_thickness = 3;

motor_shaft_radius = 7/2;
motor_mount_orad   = 4/2;
motor_mount_irad   = 3/4;

unit_height = (bumper_top_height + bumper_bottom_height) * 2 + camera_clearance * 2;

/***************************************************************************************/
//rotate([0, -90, 0])
module motor_mount()
{

    difference(){
        //big cube
        translate([0, 0, motor_mount_thickness])
        cube_cap(motor_length, motor_width, motor_height, motor_mount_thickness);
        //hole for the motor
        translate([(motor_length + motor_mount_thickness/2) /2, 0, 0])
        cube_peg(motor_mount_thickness/2, motor_width + motor_mount_thickness/6, motor_height);
        //this is just a test for the next two lines
        //translate([motor_mount_thickness/2, 0, motor_mount_thickness])
        //cube_peg(motor_length, motor_width + motor_mount_thickness, motor_height + motor_mount_thickness);
        
        //right hole
        translate([-(motor_length + motor_mount_thickness/2) /2, 5.5, 0])
        
        rotate([0, -90, 0])
        cylinder(r1 = motor_mount_irad, r2 = motor_mount_orad, h = motor_mount_thickness/2, $fn = precision, center = true);
        //left hole
        translate([-(motor_length + motor_mount_thickness/2) /2, -5.5, 0])
        rotate([0, -90, 0])
        cylinder(r1 = motor_mount_irad, r2 = motor_mount_orad, h = motor_mount_thickness/2, $fn = precision, center = true);
        //center hole
        translate([-(motor_length + motor_mount_thickness/2) /2, 0.0, 0])
        rotate([0, 90, 0])
        cylinder(r = motor_shaft_radius, h = motor_mount_thickness/2, $fn = precision, center = true);
    }
   
}
motor_mount();