/// @description Hammer Logic

var hammer = instance_create_layer(
	x,					// xPosition
	y,					// yPosition
	"projectiles",		// Layer to Spawn into
	obj_weapon_hammer	// Object to spawn
);

hammer.direction = irandom_range(45,135);
hammer.speed = 4;
hammer.gravity = 0.1;
hammer.friction = 0.01;