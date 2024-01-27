/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
//timer++;
//if (timer > spawn_time) {
//	spawn_time = spawn_object();
//	timer = 0;
//}
if (!instance_exists(left_object) || left_object.state == STATES.GROUND) {
	left_object = instance_create_depth(94, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);
	left_object.position = 0;
	left_object.image_xscale = -1;
	left_object.angle_spd *= -1;
}
if (!instance_exists(right_object) || right_object.state == STATES.GROUND) {
	right_object = instance_create_depth(room_width - 110, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);	
	right_object.position = 1;
}

if (lives_left < 0) {
	// Game Over
	instance_destroy(right_object);
	instance_destroy(left_object);
	instance_destroy(obj_malavaro);
}

if keyboard_check_pressed(vk_enter) {
	game_restart();
}