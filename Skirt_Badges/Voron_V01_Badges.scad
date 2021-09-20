// Replace with your serial number
serial="V0.000";

// Set stencil as 'true' to cut all the way through, otherwise it will engrave
stencil=true;

// Start of code, don't edit below
////////////////////////////////////////////////////////////

use <Voron-Stencil.ttf>;
use <Play-Bold.ttf>;
font1= stencil ? "Voron:style=Stencil" : "Play:style=Bold" ;

depth= stencil ? -3 : -0.5 ;

serial_length=len(serial);

echo (str("Use this badge with V0_triple_hex_120.stl skirt file from this folder."));

rotate([0,180,0])
difference(font1, serial, depth) {
    import("V0_triple_hex_badge_120.stl", center=true); 
    translate([0,0,depth]) 
    linear_extrude(3) text(text=serial, font=font1, size=6, halign="center", valign="center");
}
;
$vpr=[45,180,45];

