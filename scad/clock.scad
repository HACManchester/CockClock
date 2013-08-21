$fn=30;

use <lib/circulargear.scad>

*% square([1280-50, 2600-50], center=true);

difference()
{
	circle(r=1000/2, center=true);
	flat_gear(130, 10, 0);
}

translate([388,0])flat_gear(8, 10, 5/2);

difference()
{
	circle(r=700/2, center=true);
	flat_gear(84, 10, 0);
}

translate([240,0])flat_gear(8, 10, 5/2);

*polygon(points=[[0,40],[5,0],[35,0],[40,40]],paths=[[0,1,2,3]]);
