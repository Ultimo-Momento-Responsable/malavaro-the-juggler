/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
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
