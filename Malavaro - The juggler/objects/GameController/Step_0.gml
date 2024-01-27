/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
timer++;
if (timer > spawn_time) {
	spawn_time = spawn_object();
	timer = 0;
}