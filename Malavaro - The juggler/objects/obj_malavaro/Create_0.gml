/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
inertia = 0.15;
h_friction =  0.8;
h_speed = 10;
max_h_speed = 30;

min_angle = -60;
max_angle = -min_angle;
angular_speed = 20;
angular_inertia = 0.15;
angular_bounce = 1;
image_speed = 0.2;
depth = 1;
is_idle = true;
idle_time = 0;
idle_countdown = 0;
power_up_timer = 0;
power_up_seconds = 10;

// Animation stuff
active_sequence = -1;
sequence_layers = layer_create(depth);
juggling_timer = 64;

audio_listener_position(room_width / 2, room_height, 0);
audio_listener_orientation(room_width / 2, 0, 0, 0, 1, 0);

function calculate_speed_increment(_current_speed, _current_direction, _obj_speed = 0) {
	var _abs_current_speed = abs(_current_speed)
	var _delta_speed = _abs_current_speed >= max_h_speed ? 0 : _current_direction * h_speed * inertia;
	return _delta_speed + _obj_speed;
}

function calculate_rotation_increment(_current_angle, _current_direction) {	
	var _angle_increment = - _current_direction * angular_speed * angular_inertia;
	var _next_angle = _current_angle + _angle_increment;
	
	if (is_out_of_range(_next_angle)) {
		return 0;
	}
	
	return _angle_increment;
}

function is_out_of_range(_angle) {
	return _angle < min_angle || _angle > max_angle;
}

function is_not_straight(_angle) {
	return _angle > 0 || _angle < 0;
}

function get_tilt(_angle) {
	if (_angle < 0) {
		return 1;
	}
	
	if (_angle > 0 ) {
		return -1;
	}
	return 0;
}


function change_direction_on_collision(_speed) {	
	hspeed = _speed;
	return hspeed < 0 ? -1 : 1;
}
