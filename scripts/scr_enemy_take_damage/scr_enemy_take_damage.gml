/// @function scr_enemy_take_damage(enemy, damage, knockback, dir, slot)
/// @param enemy    the enemy instance
/// @param damage   damage amount
/// @param knockback knockback force
/// @param dir      direction of knockback
/// @param slot     which weapon slot was used (0,1,2...)

function scr_enemy_take_damage(_enemy, _damage, _knockback, _dir, _slot)
{
    if (!instance_exists(_enemy)) return;

    // Apply damage
    _enemy.hitPoints -= _damage;

    // Apply knockback
    _enemy.x += lengthdir_x(_knockback, _dir);
    _enemy.y += lengthdir_y(_knockback, _dir);

    // Visual + sound feedback
    _enemy.sprite_index = _enemy.sprW;
    audio_play_sound(snd_enemy_hit, 10, false);

    // Death check
    if (_enemy.hitPoints <= 0) {
        instance_destroy(_enemy);
    } else {
        // Reset collision after cooldown
        _enemy.alarm[_slot] = obj_player.alarmTime[_slot];
    }
}

