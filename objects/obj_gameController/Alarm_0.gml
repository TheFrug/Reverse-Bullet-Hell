with(obj_enemy_parent){
	direction = point_direction(x,y, obj_player.x, obj_player.y);
	speed     = walkSpeed;

	if (obj_player.x > x){image_xscale = -1;}
	else {image_xscale = 1;}

	depth = -y;
}

obj_player.depth = -obj_player.y;

alarm[0] = alarmTime;