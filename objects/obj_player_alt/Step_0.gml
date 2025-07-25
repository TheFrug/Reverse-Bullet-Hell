var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);

// movement, combined
var hor		 = (right - left);
var vertical = (down - up);

// override with gamepad thumb
if (gamepad_axis_value(0, gp_axislh) != 0 or gamepad_axis_value(0, gp_axislv) != 0){
hor = gamepad_axis_value(0, gp_axislh)
vertical = gamepad_axis_value(0, gp_axislv)
}

// apply
x += hor * moveSpeed;
y += vertical * walkSpeed;

if (hor > 0){image_xscale = 1;}
if (hor < 0){image_xscale = -1;}