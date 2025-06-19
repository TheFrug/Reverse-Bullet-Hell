// Reset input each frame
hInput = 0;
vInput = 0;

// Read input based on key mappings
if (keyboard_check(keyLeft)) {
	hInput -= 1;	}
if (keyboard_check(keyRight)) {
	hInput += 1;	}
if (keyboard_check(keyUp)) {
	vInput -= 1;	}
if (keyboard_check(keyDown)) {
	vInput += 1;	}

// Normalize diagonal movement
var len = point_distance(0, 0, hInput, vInput);
if (len > 0) {
	hInput /= len;
	vInput /= len;
}

// Move player
var moveX = hInput * moveSpeed;
var moveY = vInput * moveSpeed;

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