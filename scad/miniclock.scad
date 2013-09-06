use <lib/circulargear.scad>

*% square([1280-50, 2600-50], center=true);

difference()
{
	circle(r=150/2, center=true, $fn=60);
	flat_gear(90, 2, 0);
}

difference()
{
	circle(r=100/2, center=true, $fn=50);
	flat_gear(53, 2, 0);
}

for (a = [0:4])
rotate(90*a) translate([20,0]) difference()
{
	flat_gear(8, 2, 0);
	square([2.62, 4.62], center=true);
}

for (a = [0,1])
rotate(45+(90*a)) translate([20,0]) difference()
{
	circle(r=15/2, $fn=20);
	square([2.62, 4.62], center=true);
}

for (a = [2,3])
rotate(45+(90*a)) translate([20,0]) difference()
{
	circle(r=15/2, $fn=20);
	circle(r=4.62/2);
}

*polygon(points=[[0,40],[5,0],[35,0],[40,40]],paths=[[0,1,2,3]]);
