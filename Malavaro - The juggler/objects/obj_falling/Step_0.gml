/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer --;

if (timer == 0) {
	var _initial_angle = position == 0 ? 30 : 120;
	direction = random_range(_initial_angle, _initial_angle + 50);
	speed = spd;
	gravity = spd_gravity;
	img_angle_spd = angle_spd;
	is_idle = false;
}

if (is_idle) {
	percentage += 1/120;
	var _position_x = animcurve_channel_evaluate(curve_x, percentage);
	var _position_y = animcurve_channel_evaluate(curve_y, percentage);
	
	x = (start_position[0] + _position_x * 20);
	y = (start_position[1] + _position_y * 20);
	if percentage >= 1 percentage = 0;
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
	
	if(!has_scored && (x - sprite_width) > room_width || (x + sprite_width) < 0) {
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
