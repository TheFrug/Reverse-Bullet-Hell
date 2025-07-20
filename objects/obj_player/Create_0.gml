// --- PLAYER STATS ---

pickupRange = 64;
damageMod = 1;
// Movement Variables
moveSpeed = 2;

// --- Gamepad ---
gamepad_set_axis_deadzone(
	0,				// Device id
	0.2				// Deadzone
);

// Keybinds TODO: Make configurable in menu
keyUp = ord("W");
keyDown = ord("S");
keyLeft = ord("A");
keyRight = ord("D");

// Directional input
hInput = 0;
vInput = 0;

// --- Weapon System ---
alarmTime0 = 80;
alarmTime1 = 120;

alarm[0] = alarmTime0;
alarm[1] = alarmTime1;