/// @description Dagger Logic

var dagger = instance_create_layer(
	x,					// xPosition
	y,					// yPosition
	"projectiles",		// Layer to Spawn into
	obj_weapon_dagger	// Object to spawn
);

var dir = irandom_range(0,360);
dagger.direction = dir;
dagger.image_angle = dir - 90;
dagger.speed	 = 4;