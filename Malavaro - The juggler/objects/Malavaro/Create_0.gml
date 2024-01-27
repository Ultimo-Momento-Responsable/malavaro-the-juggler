/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
inertia = 0.15;
h_friction =  0.8;
h_speed = 10;
max_h_speed = 30;

max_angle = 170;
min_angle = 10;
angular_speed = 20;
angular_inertia = 0.15;
angular_bounce = 10;

function calculate_speed_increment(_current_speed, _current_direction) {
	var _abs_current_speed = abs(_current_speed)
	return _abs_current_speed >= max_h_speed ? 0 : _current_direction * h_speed * inertia;
}

function calculate_rotation_increment(_current_angle, _current_direction) {
	if (is_out_of_range(_current_angle)) {
		return 0;
	}
	
	return - _current_direction * angular_speed * angular_inertia;
}

function is_out_of_range(_angle) {
	return _angle <= min_angle || _angle >= max_angle
}

function is_not_straight(_angle) {
	return _angle > 90 || _angle < 90;
}

function get_tilt(_angle) {
	if (_angle < 90) {
		return 1;
	}
	
	if (_angle > 90 ) {
		return -1;
	}
	
	return 0;
}