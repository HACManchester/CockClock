//
// Circular gear generator
//
// By Ketil Froyn <ketil@froyn.name>, 2012
// http://ketil.froyn.name/
// 
// (C) 2012 Ketil Froyn, used under a Creative Commons Attribution-ShareAlike 
// license: http://creativecommons.org/licenses/by-sa/3.0/
//
// Inspired by SteMega's robotic gripper:
// http://www.thingiverse.com/thing:33783
//

// Main parameters
tooth_diameter=3;
tooth_number=23;
center_hole_diameter = 2;

$fn=30; // This seems to do the trick

module flat_gear(tooth_number, tooth_diameter=30, center_hole_diameter=5)
{
	// Math and rendering
	circum_circles=2*tooth_number;
	base_circumference=2*tooth_number*tooth_diameter;
	base_radius=base_circumference/(2*3.14159);

	difference() {

	  // First, join the main cylinder and all the "teeth"
	  union() {
	    circle(r=base_radius);
	    for ( i = [ 0 : tooth_number - 1 ] ) {
	      translate([(base_radius * cos(360 * 2 * i/circum_circles)), 
		              (base_radius * sin(360 * i * 2 / circum_circles))]) 
		  circle(r=tooth_diameter/2);
	    }
	  }

	  // Then we make an indent to fit each tooth
	  for ( i = [ 0 : tooth_number - 1 ] ) {
	    translate([(base_radius * cos(360 * (2 * i + 1)/circum_circles)), 
		            (base_radius * sin(360 * (i * 2 + 1)/ circum_circles))]) 
		circle(r=tooth_diameter/2);
	  }
	  
	  // Finally, make the center hole
	  if(center_hole_diameter) circle(r=center_hole_diameter);
	}
}

flat_gear(8);
