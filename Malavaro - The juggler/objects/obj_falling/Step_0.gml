/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer --;

if (timer == 0) {
	var _initial_angle = position == 0 ? 45 : 115;
	direction = random_range(_initial_angle, _initial_angle + 35);
	speed = spd;
	gravity = spd_gravity;
	img_angle_spd = angle_spd;
	if position == 0 image_xscale = -1;
	state = STATES.FALLING;
	audio_play_sound_at(throw_sound, start_position[0], start_position[1], 0, 100, 300, 1, false, 1);
}

switch (state) {
	case STATES.IDLE:
		percentage += 1/120;
		var _position_x = animcurve_channel_evaluate(idle_anim_x, percentage);
		var _position_y = animcurve_channel_evaluate(idle_anim_y, percentage);
		if position == 0 image_xscale = -1;
		x = (start_position[0] + _position_x * (distance_animation - 10));
		y = (start_position[1] + _position_y * (distance_animation - 15));
		if percentage >= 1 percentage = 0;
		break;
	case STATES.FALLING:
		percentage = 0;
		start_position[0] = x;
		start_position[1] = y;
		throwing_timer = 30;
		break;
	case STATES.COLLISION:
		percentage += 1/anim_timer;
		var _position = animcurve_channel_evaluate(collision_anim, percentage);
		x = malavaro.x;
		y = start_position[1] + _position * 10;
	
		if (percentage >= 1) {
			state = STATES.THROWING_START;
		}
		break;
	case STATES.THROWING_START:
		bounces ++;
		direction = img_angle_in_collision;
		speed = spd;
		audio_play_sound_at(swing_sound[irandom_range(0, 1)], start_position[0], start_position[1], 0, 100, 300, 1, false, 1);
		state = STATES.THROWING_END;
		break;
	case STATES.THROWING_END: 
		throwing_timer--;
		if (!instance_position(x,y,obj_malavaro) && throwing_timer <= 0) {
			state = STATES.FALLING;
		}
		break;
	case STATES.GROUND:
		death_timer--;
		if (abs(hspeed) < (20 / death_timer)) {
			hspeed = 0;
			img_angle_spd = 0;
		} else {
			hspeed += (hspeed > 0 ? -0.2 : 0.2);
			img_angle_spd = (image_angle > 0 ? 1 - (5/death_timer) : -1 - (5/death_timer));
		}
			
		image_alpha -= (1 / death_timer);
		y = room_height;
		if (death_timer == 0) {
			instance_destroy(self);
		}
		break;
}


if (bounces > 0) {
	if(!has_gained_life && bounces % 3 == 0) {
		// If has juggled object 3, 6, 9, 12, etc, gain a life
		audio_play_sound_at(snd_haha, malavaro.x, malavaro.y, 0, 100, 300, 1, false, 1);
		obj_game_controller.lives_left ++;
		has_gained_life = true;
		obj_game_controller.life_bonus = true;
	}
	
	if (has_gained_life && bounces % 3 != 0) {
		has_gained_life = false;
	}
	
	if(!has_scored && ((x - abs(sprite_width / 1.5)) > room_width || (x + abs(sprite_width / 1.5)) < 0)) {
		// Should score
		has_scored = true;
		global.score_points += score_points * power(2, bounces - 1);
		instance_destroy(self);
	} 
} else {
	if ((x - abs(sprite_width / 1.5)) > room_width || (x + abs(sprite_width / 1.5)) < 0) {
		instance_destroy(self);
	}
}
	

if((y - sprite_height/2) > room_height && state == STATES.FALLING) {
	// Should explode
	audio_play_sound_at(fall_sound, x, y, 0, 100, 300, 1, false, 1);
	obj_game_controller.lives_left --;
	state = STATES.GROUND;
	gravity = 0;
}
	
image_angle += img_angle_spd;