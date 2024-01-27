/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer --;

if (timer == 0) {
	var _initial_angle = position == 0 ? 30 : 120;
	direction = random_range(_initial_angle, _initial_angle + 50);
	speed = spd;
	gravity = spd_gravity;
	img_angle_spd = angle_spd;
	if position == 0 image_xscale = -1;
	state = STATES.FALLING
}

switch (state) {
	case STATES.IDLE:
		percentage += 1/120;
		var _position_x = animcurve_channel_evaluate(idle_anim_x, percentage);
		var _position_y = animcurve_channel_evaluate(idle_anim_y, percentage);
		if position == 0 image_xscale = -1;
		x = (start_position[0] + _position_x * 20);
		y = (start_position[1] + _position_y * 20);
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
		y = start_position[1] + _position * 20;
	
		if (percentage >= 1) {
			state = STATES.THROWING_START;
		}
		break;
	case STATES.THROWING_START:
		bounces ++;
		direction = img_angle_in_collision;
		speed = spd;
		state = STATES.THROWING_END;
		break;
	case STATES.THROWING_END: 
		throwing_timer--;
		if (!instance_position(x,y,obj_malavaro) && throwing_timer <= 0) {
			state = STATES.FALLING;
		}
		break;
}


if (bounces > 0) {
	if(!has_gained_life && bounces % 3 == 0) {
		// If has juggled object 3, 6, 9, 12, etc, gain a life
		obj_game_controller.lives_left ++;
		has_gained_life = true;
	}
	
	if (has_gained_life && bounces % 3 != 0) {
		has_gained_life = false;
	}
	
	if(!has_scored && ((x - abs(sprite_width)) > room_width || (x + abs(sprite_width)) < 0)) {
		// Should score
		has_scored = true;
		obj_game_controller.score_points += score_points * power(2, bounces - 1);
		instance_destroy(self);
	} 
}

if((y - sprite_height) > room_height) {
	// Should explode
	obj_game_controller.lives_left --;
	instance_destroy(self);
}
	
image_angle += img_angle_spd;
