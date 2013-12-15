///////////////////////////
// Constant Measurements
///////////////////////////
MajorCircleRadius = 41;
MinorCircleRatio = 0.75;
MinorCircleYLocationRatio = 0.05;
MinorCircleXLocationRatio = 0.45;
Thickness = 3.8;
BuldgeCircleRatio = 0.9;
BuldgeHeight = 7.3;

// Derived Measurements
minorCircleRadius = MajorCircleRadius*MinorCircleRatio;
buldgeCircleRadius = MajorCircleRadius*BuldgeCircleRatio;
buldgeSphereRadius = BuldgeHeight/2 + (pow((buldgeCircleRadius*2),2) / (8*BuldgeHeight));


///////////////////////////
// Build Object
///////////////////////////
flatBody();

// BuldgeSphere
translate([0,0,-buldgeSphereRadius+BuldgeHeight+(Thickness/2)])
sphere(r=buldgeSphereRadius, $fn=100);

// // Main Circle Illustration
// translate([0,0,0.1])
// majorCircle();

// // BuldgeCircle Illustration
// translate([0,0,0.2])
// cylinder(r=buldgeCircleRadius, h=Thickness);


///////////////////////////
// Modules
///////////////////////////

module flatBody() {
	hull($fn=50) {
		majorCircle();
		minorCircles();
	}
}

module topElipse() {
	translate([0,MajorCircleRadius*0.26,0])
	scale([2,1,1])
	cylinder(r=minorCircleRadius, h=Thickness, center=true);
}

module minorCircles() {
	minorCircle();
	mirror([1,0,0]) minorCircle();
}

module minorCircle() {
	translate([MajorCircleRadius*MinorCircleXLocationRatio, MajorCircleRadius*MinorCircleYLocationRatio, 0])
	rotate([0,0,40])
	scale([1.2,1,1])
	// cube([20,20,20]);
	cylinder(r=minorCircleRadius, h=Thickness, center=true);
}

module majorCircle() {
	color("blue")
	cylinder(r=MajorCircleRadius, h=Thickness, center=true);
}
