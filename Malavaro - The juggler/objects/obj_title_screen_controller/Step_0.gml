/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (keyboard_check_pressed(vk_enter)) {
	room_goto(rm_game);
}

if (keyboard_check_pressed(ord("C"))) {
	room_goto(rm_credits);
}