/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _surface_drop_shadow = surface_create(room_width, room_height);
surface_set_target(_surface_drop_shadow);

draw_clear_alpha(c_white, 0)

with (obj_malavaro) {
	draw_self();
}

surface_reset_target();

draw_surface_ext(_surface_drop_shadow, 6, 4, 1, 1, 0, c_black, 0.5);

surface_free(_surface_drop_shadow);

if (active_sequence == -1) draw_self();
