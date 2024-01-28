// Juggling animation sequence
if (active_sequence != -1) {
	juggling_timer --;
	layer_sequence_x(active_sequence, x);
	layer_sequence_y(active_sequence, y);
	layer_sequence_xscale(active_sequence, image_xscale);
	layer_sequence_yscale(active_sequence, image_yscale);
	layer_sequence_angle(active_sequence, image_angle);
	
	if (juggling_timer == 0) {
		layer_sequence_destroy(active_sequence);
		//visible = true;
		active_sequence = -1;
	}
}

// Idle
if(speed == 0 && image_angle == 0) {
	is_idle = true;
}

// Check input
var _current_direction = 0;

if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	_current_direction = 1;
}

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	_current_direction = -1;
}

if (is_idle) {
	if (_current_direction != 0) {
		// If player input stop idle
		is_idle = false;
		idle_time = 0;
		idle_countdown = 15;
	} else {
		if (idle_countdown > 0) {
			idle_countdown --;
		} else {
			// If idle then do animation
			speed = sin(idle_time) * 5;
			image_angle = sin(idle_time) * 25;
			idle_time += 0.05;
		}
	}
}


// Friction
if (abs(speed) > 0) {
	if (abs(speed) < h_friction) {
		speed = 0;
	} else {
		speed += (speed > 0 ? -1 : 1) * h_friction;
	}
}



// Go back to standing straight
if (is_not_straight(image_angle)) {
	if (abs(image_angle) < angular_bounce) {
		image_angle = 0;
	} else {
		if (!(_current_direction != 0 && (image_angle == max_angle || image_angle == min_angle))) {
			image_angle += get_tilt(image_angle) * angular_bounce;
		}
	}
}

var _obj_collision_speed = 0;

if (place_meeting(x, y, obj_falling)) {
	var _obj_collision = instance_place(x, y, obj_falling);
	if (_obj_collision) {
		if (_obj_collision.state == STATES.FALLING) {
			if (!_obj_collision.power_up) {
				_obj_collision.img_angle_in_collision = image_angle + 90;
				if (power_up_timer > 0) {
					_obj_collision.spd = _obj_collision.speed * 4;
					
				} else {
					_obj_collision.spd = obj_collision.speed + (speed / 2);
				}
				_obj_collision.malavaro = self;
				_obj_collision.state = STATES.COLLISION;
				if (place_meeting(x, y, obj_elephant)) {
					_obj_collision_speed = _obj_collision.hspeed * 1.5;
				}
				if (place_meeting(x, y, obj_contortionist)) {
					_obj_collision_speed = _obj_collision.hspeed;
				}
			} else {
				power_up_timer = 60 * power_up_seconds;
				audio_play_sound(snd_haha, 1, false, 1);
				instance_destroy(_obj_collision);
			}
			
			// Juggling animation stuff
			if (active_sequence == -1) {
				active_sequence = layer_sequence_create(sequence_layers, x, y, seq_malavaro_juggling);
				layer_sequence_x(active_sequence, x);
				layer_sequence_y(active_sequence, y);
				layer_sequence_angle(active_sequence, image_angle);	
				juggling_timer = 64;
				//visible = false;
			} 
		}
	}
}

if (power_up_timer > 0) {
	if (power_up_timer > 60 * (power_up_seconds - 1)) {
		image_xscale += 0.01;
		image_yscale += 0.01;
	}
	if (power_up_timer < 30) {
		image_xscale -= 0.02;
		image_yscale -= 0.02;
	}
	power_up_timer--;
} else {
	image_xscale = 1;
	image_yscale = 1;
}

// Malavaro hit edge screen
if (x <= sprite_width/2 || x >= room_width - sprite_width/2) {
	speed = 0;
	x = x <= sprite_width/2 ? sprite_width/2 + 1 : room_width - sprite_width/2 - 1;
}

speed += calculate_speed_increment(speed, _current_direction, _obj_collision_speed);
image_angle += calculate_rotation_increment(image_angle, _current_direction);
