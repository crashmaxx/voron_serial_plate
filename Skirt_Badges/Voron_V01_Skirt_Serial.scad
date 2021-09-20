// Replace with your serial number
serial="V0.000";

// Use stencil to cut all the way through,
// otherwise it will engrave
stencil=true;

// Start of code, don't edit below
////////////////////////////////////////////////////////////

use <Voron-Stencil.ttf>;
use <Play-Bold.ttf>;
font1= stencil ? "Voron:style=Stencil" : "Play:style=Bold" ;

serial_length=len(serial);

skirt= (serial_length<7)? "V0_triple_hex_120.stl" : "V0_quad_hex_120.stl";

depth= stencil ? -3 : -1.5 ;

rotate([0,180,0])
difference(font1, serial, depth, skirt) {
    import(skirt, center=true); 
    translate([0,0,depth]) 
    linear_extrude(3) text(text=serial, font=font1, size=10, halign="center", valign="center");
}
$vpr=[45,180,45];
