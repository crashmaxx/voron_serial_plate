// Replace with your serial number
serial="VS.000";

/* Choose your model, options are:
SW (SwitchWire) (Use 250 bed)
V24 (Voron 2.4)
V22 (Voron 2.2) (Not Ready)
VT (Voron Trident)
V18 (Voron 1.8) (Not Ready)
*/
model="SW";

// Bed size. 250, 300, 350
bed="250";

// Set stencil as 'true' to cut all the way through, otherwise it will engrave
stencil=true;

// Start of code, don't edit below
////////////////////////////////////////////////////////////

use <Voron-Stencil.ttf>;
use <Play-Bold.ttf>;
font1= stencil ? "Voron:style=Stencil" : "Play:style=Bold" ;

depth= stencil ? -3 : -1.5 ;

serial_length=len(serial);

baseplate= (serial_length<7)? "_double_hex_" : "_triple_hex_";

badge= str(model,baseplate,"badge_",bed,".stl");

skirt= str(model,baseplate,bed,".stl");

echo (str("Use this badge with ",skirt," skirt file from this folder."));

rotate([0,180,0])
difference(font1, serial, depth, badge) {
    import(badge, center=true); 
    translate([0,0,depth]) 
    linear_extrude(3) text(text=serial, font=font1, size=9, halign="center", valign="center");
}
;
$vpr=[45,180,45];

