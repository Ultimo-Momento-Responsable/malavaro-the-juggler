/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (lives_left >= 0) {
	draw_set_alpha(1);
	
	var _txt_score = "Score: " + string(score_points);
	var _txt_lives = "Lives: " + string(lives_left);
	
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_text_ext(room_width - 48, 48,_txt_score, 0, 250);
	
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text_ext(48, 48, _txt_lives, 0, 250);
	
	draw_set_color(c_black);
	var _rect_score_width;
	var _rect_lives_width;
	var _rect_height = 48;
} else {
	// Draw Game Over Screen
	draw_set_alpha(1);
	
	draw_set_font(fnt_game_over);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2 - 120, "Game Over", 0, 700);
	
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2, "Final score: " + string(score_points), 0, 700);

	if keyboard_check_pressed(vk_enter) {
		game_restart();
	}
}