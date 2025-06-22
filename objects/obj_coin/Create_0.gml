event_inherited();

function onPickup(player) {
    obj_gameController.gold += 5;
	audio_play_sound(snd_pickup_coin, 1, false);
}