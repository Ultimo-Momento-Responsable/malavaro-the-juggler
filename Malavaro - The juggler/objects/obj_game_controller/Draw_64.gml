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
	var _padding = 5;
	var _h_padding = 420;
	var _font_height = 12;
	var _spr_malavaro_height = 20;
	var _spr_score_width = 190;
	var _spr_lives_width = 69;
	var _spr_score_height = 38;
	
	
	draw_sprite(spr_score, spr_score_frame, room_width - _padding - _h_padding - _spr_score_width, _padding);
	
	
	draw_set_halign(fa_right);
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_text_ext(room_width - _padding * 2 - _h_padding, _spr_score_height / 2 - _font_height / 2, string(global.score_points), 0, _spr_score_width);
	draw_set_halign(fa_left);
	draw_text_ext(room_width - _spr_score_width + _padding - _h_padding, _spr_score_height / 2 - _font_height / 2, _txt_score, 0, _spr_score_width);	

	draw_sprite(spr_lives, spr_score_frame, _padding + _h_padding, _padding);

	draw_set_halign(fa_right);
	draw_set_font(fnt_score);
	draw_set_color(c_white);
	draw_text_ext(_spr_lives_width - _padding + _h_padding, _spr_score_height / 2 - _font_height / 2, _txt_lives, 0, _spr_lives_width);
	
	if (life_bonus) {
		percentage += 1 / life_bonus_timer;
		var _scale_curve = animcurve_channel_evaluate(anim_life_bonus, percentage);
		draw_sprite_ext(spr_malavaro_lives, spr_score_frame,  _padding * 2 + _h_padding + 10, _padding + _spr_score_height / 2, 1 + _scale_curve, 1 + _scale_curve, 0, c_white, 1);
		if percentage == 1 life_bonus = false;
	} else {
		percentage = 0;
		draw_sprite(spr_malavaro_lives, spr_score_frame, _padding * 2 + _h_padding + 10, _padding + _spr_score_height / 2);
	}
}


