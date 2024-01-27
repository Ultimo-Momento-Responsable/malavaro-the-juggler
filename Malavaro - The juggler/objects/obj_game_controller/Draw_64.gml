/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (lives_left >= 0) {
	// Score animation
	if (animation_timer > 0) {
		animation_timer --;
	} else {
		spr_score_frame ++;
		spr_score_frame %= 3;
		animation_timer = 1 / animation_speed;
	}
	
	var _txt_score = "Score:";
	var _txt_lives = "x" + string(lives_left);
	var _padding = 16;
	var _font_height = 32;
	var _spr_malavaro_height = 45;
	var _spr_score_width = 500;
	var _spr_lives_width = 180;
	var _spr_score_height = 100;
	
	draw_sprite(spr_score, spr_score_frame, room_width - _padding - _spr_score_width, _padding);
	
	draw_set_halign(fa_right);
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_text_ext(room_width - _padding * 2, _padding + _spr_score_height / 2 - _font_height / 2, string(score_points), 0, _spr_score_width);
	draw_set_halign(fa_left);
	draw_text_ext(room_width - _spr_score_width + _padding, _padding + _spr_score_height / 2 - _font_height / 2, _txt_score, 0, _spr_score_width);
	
	draw_sprite(spr_lives, spr_score_frame, _padding, _padding);
	draw_sprite(spr_malavaro_lives, spr_score_frame, _padding * 2 , _padding + _spr_score_height / 2 - _spr_malavaro_height / 2);

	draw_set_halign(fa_right);
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_text_ext(_spr_lives_width - _padding, _padding + _spr_score_height / 2 - _font_height / 2, _txt_lives, 0, _spr_lives_width);
} else {
	// Draw Game Over Screen
	draw_set_font(fnt_game_over);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2 - 120, "Game Over", 0, 700);
	
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext(room_width / 2, room_height / 2, "Final score: " + string(score_points), 0, 700);
}