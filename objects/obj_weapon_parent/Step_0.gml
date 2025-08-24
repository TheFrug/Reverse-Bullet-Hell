// obj_weapon_parent - Step

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
        if (!instance_exists(_enemy)) continue;

        // Weapon slot 1 (Slash)
        if (dmg_type == "wp1" && _enemy.can_collide_wp1) {
            _enemy.can_collide_wp1 = false;
            var dir = point_direction(x, y, _enemy.x, _enemy.y);
            scr_enemy_take_damage(_enemy, damage, knockback, dir, 0);
        }

        // Weapon slot 2 (Hammer)
        if (dmg_type == "wp2" && _enemy.can_collide_wp2) {
            _enemy.can_collide_wp2 = false;
            var dir = point_direction(x, y, _enemy.x, _enemy.y);
            scr_enemy_take_damage(_enemy, damage, knockback, dir, 1);
        }

        // Weapon slot 3 (Dagger)
        if (dmg_type == "wp3" && _enemy.can_collide_wp3) {
            _enemy.can_collide_wp3 = false;
            var dir = point_direction(x, y, _enemy.x, _enemy.y);
            scr_enemy_take_damage(_enemy, damage, knockback, dir, 2);
        }
    }
}

ds_list_destroy(_list);
