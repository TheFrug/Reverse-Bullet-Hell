// Check collisions between rectangle and all instances of obj_enemy_parent
var _list = ds_list_create();
var _num = collision_rectangle_list(
    bbox_left,
    bbox_top,
    bbox_right,
    bbox_bottom,
    obj_enemy_parent,
    false,
    true,
    _list,
    false
);

if (_num > 0) {
    for (var i = 0; i < _num; ++i) {
        var _enemy = _list[| i];

		if (instance_exists(_enemy)) {
	        // Example: Weapon slot 1 (Slash)
	        if (dmg_type == "wp1" && _enemy.can_collide_wp1) {
	            _enemy.can_collide_wp1 = false; // disable until reset
	            _enemy.hitPoints -= damage;

	            // Knockback
	            var dir = point_direction(x, y, _enemy.x, _enemy.y);
	            _enemy.x += lengthdir_x(knockback, dir);
	            _enemy.y += lengthdir_y(knockback, dir);

	            // Visual + sound feedback
	            _enemy.sprite_index = _enemy.sprW;
	            audio_play_sound(snd_enemy_hit, 10, false);

	            // Death check
	            if (_enemy.hitPoints <= 0) {
	                instance_destroy(_enemy);
	            } else {
	            // Start alarm on the enemy to reset collision flag
	            _enemy.alarm[0] = obj_player.alarmTime[0];
				}
	        }

	        // Example: Weapon slot 2 (Hammer)
	        if (dmg_type == "wp2" && _enemy.can_collide_wp2) {
	            _enemy.can_collide_wp2 = false;
	            _enemy.hitPoints -= damage;

	            var dir = point_direction(x, y, _enemy.x, _enemy.y);
	            _enemy.x += lengthdir_x(knockback, dir);
	            _enemy.y += lengthdir_y(knockback, dir);

	            _enemy.sprite_index = _enemy.sprW;
	            audio_play_sound(snd_enemy_hit, 10, false);

	            if (_enemy.hitPoints <= 0) {
	                instance_destroy(_enemy);
	            } else {
	            _enemy.alarm[1] = obj_player.alarmTime[1];
				}
	        }

	        // Example: Weapon slot 3 (Dagger)
	        if (dmg_type == "wp3" && _enemy.can_collide_wp3) {
	            _enemy.can_collide_wp3 = false;
	            _enemy.hitPoints -= damage;

	            var dir = point_direction(x, y, _enemy.x, _enemy.y);
	            _enemy.x += lengthdir_x(knockback, dir);
	            _enemy.y += lengthdir_y(knockback, dir);

	            _enemy.sprite_index = _enemy.sprW;
	            audio_play_sound(snd_enemy_hit, 10, false);

	            if (_enemy.hitPoints <= 0) {
	                instance_destroy(_enemy);
	            } else {
	            _enemy.alarm[2] = obj_player.alarmTime[2];
				}
	        }
		}
    }
}
ds_list_destroy(_list);
