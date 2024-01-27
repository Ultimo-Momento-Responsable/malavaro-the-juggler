/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


// Fricción
if (abs(speed) > 0) {
	if (abs(speed) < h_friction) {
		speed = 0;
	} else {
		speed += (speed > 0 ? -1 : 1) * h_friction;
	}
}

// Go back to standing straight
if (is_not_straight(image_angle)) {
	if (abs(image_angle - 90) < angular_bounce) {
		image_angle = 90;
	} else {
		image_angle += get_tilt(image_angle) * angular_bounce;
	}
}

var _current_direction = 0;

if (keyboard_check(vk_right)) {
	_current_direction = 1;
}

if (keyboard_check(vk_left)) {
	_current_direction = -1;
}

speed += calculate_speed_increment(speed, _current_direction);
image_angle += calculate_rotation_increment(image_angle, _current_direction);

var _obj_collision = instance_place(x, y, obj_falling);
if (_obj_collision) {
	_obj_collision.direction = image_angle;
	_obj_collision.speed += speed;
}