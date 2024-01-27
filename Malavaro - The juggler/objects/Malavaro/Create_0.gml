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
function calculate_speed_increment(_current_speed, _current_direction) {
	var _abs_current_speed = abs(_current_speed)
	return _abs_current_speed >= max_h_speed ? 0 : _current_direction * h_speed * inertia;
}

function calculate_rotation_increment(_current_angle, _current_direction) {
	//if (is_out_of_range(_current_angle)) {
	//	return 0;
	//}
	
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