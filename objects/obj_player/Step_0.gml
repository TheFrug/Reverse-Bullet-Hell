// Reset input each frame
hInput = 0;
vInput = 0;

// Default strength if using keyboard
var analog_strength = 1;

// Read input based on key mappings
if (keyboard_check(keyLeft)) {
	hInput -= 1;	}
if (keyboard_check(keyRight)) {
	hInput += 1;	}
if (keyboard_check(keyUp)) {
	vInput -= 1;	}
if (keyboard_check(keyDown)) {
	vInput += 1;	}

// Gamepad override

if (gamepad_is_connected(0)) {
	var pad_h = gamepad_axis_value(0, gp_axislh);
	var pad_v = gamepad_axis_value(0, gp_axislv);

	// If there's input from the analog stick, override keyboard
	if (abs(pad_h) > 0.2 || abs(pad_v) > 0.2) {
	    hInput = pad_h;
	    vInput = pad_v;
		
		// calculate stick strength (0 to 1)
		analog_strength = clamp(point_distance(0, 0, pad_h, pad_v), 0, 1);
	}
}
// Flip sprite based on horizontal movement
if (hInput != 0) {
	image_xscale = sign(hInput); // 1 = right, -1 = left
}

// Normalize diagonal movement
var len = point_distance(0, 0, hInput, vInput);
if (len > 0) {
	hInput /= len;
	vInput /= len;
}

// Move player
var moveX = hInput * moveSpeed * analog_strength;
var moveY = vInput * moveSpeed * analog_strength;

// Move on X axis and check for collision
if (place_meeting(x + moveX, y, obj_blocker)) {
	while (!place_meeting(x + sign(moveX), y, obj_blocker)) {
		x += sign(moveX);	
	}
} else {
	x += moveX;
}

// Move on Y axis and check for collision
if (place_meeting(x, y + moveY, obj_blocker)) {
	while (!place_meeting(x, y + sign(moveY), obj_blocker)) {
		y += sign(moveY);
	}
} else {
	y += moveY;
}

/*
// Firing Weapons
var controller = obj_gameController;

if (controller == noone) exit;

// Loop through all currently owned weapons
var _weapons = controller.weapons;
var _weaponKeys = variable_struct_get_names(_weapons);
var _time = current_time;

var ui = layer_get_id("projectiles");

for (var i = 0; i < array_length(_weaponKeys); i++) {
	var weaponName = _weaponKeys[i];
	var weapon = _weapons[? weaponName];
	
	if (_time - weapon.lastFired >= weapon.cooldown * 16.6667) {
		var target = get_nearest_damageable(x, y);
		
		if (target != noone) {
			for (var j = 0; j < weapon.projectileCount; j++) {
				fire_projectile(weaponName, x, y, target, weapon);	
			}
			weapon.lastFired = _time;
		}
	}
}
*/