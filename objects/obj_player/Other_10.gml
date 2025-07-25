/// @description Slash Logic

var slash = instance_create_layer(
	x,					// xPosition
	y,					// yPosition
	"projectiles",		// Layer to Spawn into
	obj_weapon_bigSword	// Object to spawn
);

slash.image_xscale = image_xscale;

if (image_xscale == 1){slash.addX = 15;} // If player looking right
if (image_xscale == -1){slash.addX = -15;} // If player looking left
