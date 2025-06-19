// Find nearest player
var _player = instance_nearest(x, y, obj_player);

// Chek if we have target and if it's still valid
if (pickupTarget != noone) {
	var dist = point_distance(x, y, pickupTarget.x, pickupTarget.y);
	
	// If player left range, stop attracting
	if (dist > pickupTarget.pickupRange) {
		pickupTarget = noone;	
	}
}

// If no target, check for one
if (pickupTarget == noone && _player != noone) {
	var distToNearest = point_distance(x, y, _player.x, _player.y);
	
	if (distToNearest < _player.pickupRange) {
		pickupTarget = _player;	
	}
}

// If targeting, move toward player
if (pickupTarget != noone) {
	var dir = point_direction(x, y, pickupTarget.x, pickupTarget.y);
	x += lengthdir_x(pickupSpeed, dir);
	y += lengthdir_y(pickupSpeed, dir);
		
	// Close enough to pick up
	if (point_distance(x, y, pickupTarget.x, pickupTarget.y) < 8) {
		onPickup(pickupTarget); // Player passed in
		instance_destroy();
	}
}