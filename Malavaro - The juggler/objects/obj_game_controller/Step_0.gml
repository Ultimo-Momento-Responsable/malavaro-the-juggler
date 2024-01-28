/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (!instance_exists(left_object) || left_object.state == STATES.GROUND) {
	var _power_up = irandom(20);
	if (_power_up == 1) {
		left_object = instance_create_depth(94, 107, sprite_depth, obj_power_up_strong);
	} else {
		left_object = instance_create_depth(94, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);
	}
	left_object.position = 0;
	left_object.image_xscale = -1;
	left_object.angle_spd *= -1;
}
if (!instance_exists(right_object) || right_object.state == STATES.GROUND) {
	var _power_up = irandom(20);
	if (_power_up == 1) {
		right_object = instance_create_depth(room_width - 110, 107, sprite_depth, obj_power_up_strong);
	} else {
		right_object = instance_create_depth(room_width - 110, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);	
	}
	right_object.position = 1;
}

if (lives_left < 0) {
	// Game Over
	instance_destroy(right_object);
	instance_destroy(left_object);
	instance_destroy(obj_malavaro);
	audio_stop_sound(snd_music);
	if (!played_game_over_sound) {
		audio_play_sound(snd_boo, 1, false);
		played_game_over_sound = true;
	}
	room_goto(rm_final_screen);
}

if keyboard_check_pressed(vk_enter) {
	game_restart();
}

if (global.score_points >= 1000 * counter_ohh) {
	audio_play_sound(ohh_sounds[irandom(array_length(ohh_sounds) - 1)], 1, false, 0.6);
	counter_ohh++;
}