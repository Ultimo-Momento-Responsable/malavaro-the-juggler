/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer++;
if (timer > spawn_time) {
	spawn_time = spawn_object();
	timer = 0;
}
if (!instance_exists(left_object)) {
	left_object = instance_create_depth(0, 64, 0, objects[irandom(array_length(objects) - 1)]);
}
if (!instance_exists(right_object)) {
	right_object = instance_create_depth(room_width, 64, 0, objects[irandom(array_length(objects) - 1)]);
}