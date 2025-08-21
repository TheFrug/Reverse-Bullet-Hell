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
alarmTime[0] = 100;
alarmTime[1] = 80;
alarmTime[2] = 60;

alarm[0] = alarmTime[0];
alarm[1] = alarmTime[1];
alarm[2] = alarmTime[2];

slot[0] = "";
slot[1] = "";
slot[2] = "";

// --- Weapon Stats ---

// Slash/Big Sword
damage_slash = 3;
knockback_slash = 20;

// Hammer
damage_hammer = 5;
knockback_hammer = 7;

// Thrown Dagger
damage_dagger = 1;
knockback_dagger = 3;