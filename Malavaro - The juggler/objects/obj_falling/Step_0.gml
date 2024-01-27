/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer --;

if (timer == 0) {
	var _initial_angle = position == 0 ? 30 : 120;
	direction = random_range(_initial_angle, _initial_angle + 50);
	speed = spd;
	gravity = spd_gravity;
	img_angle_spd = angle_spd;
}

if (is_iddle) {
	percentage += 1/120;
	var _position_x = animcurve_channel_evaluate(curve_x, percentage);
	var _position_y = animcurve_channel_evaluate(curve_y, percentage);
	show_debug_message(_position_y, _position_x);
	x = (start_position[0] + _position_x * 20);
	y = (start_position[1] + _position_y * 20);
	if percentage >= 1 percentage = 0;
}

if (bounces > 0) {
	if((x - sprite_width) > room_width || (x + sprite_width) < 0) {
		// Should score
		obj_game_controller.score_points += score_points * bounces;
		instance_destroy(self);
	} 
}

if((y - sprite_height) > room_height) {
	// Should explode
	instance_destroy(self);
}
	
image_angle += img_angle_spd;
