/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
//timer++;
//if (timer > spawn_time) {
//	spawn_time = spawn_object();
//	timer = 0;
//}
if (!instance_exists(left_object)) {
	left_object = instance_create_depth(120, 120, 0, objects[irandom(array_length(objects) - 1)]);
	left_object.position = 0;
}
if (!instance_exists(right_object)) {
	right_object = instance_create_depth(room_width- 120, 120, 0, objects[irandom(array_length(objects) - 1)]);
	right_object.position = 1;
}

if (lives_left < 0) {
	// Game Over
	instance_destroy(right_object);
	instance_destroy(left_object);
	instance_destroy(obj_malavaro);
}