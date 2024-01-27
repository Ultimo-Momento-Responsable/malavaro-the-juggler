// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function spawn_object(){
	var _position = floor(irandom(1));
	if (_position == 0) {
		set_object_initial_values(left_object, 30);
	} else {
		set_object_initial_values(right_object, 120);
	}
	return random_range(60 * initial_seconds, 60 * (initial_seconds - 2));
}

function set_object_initial_values(_obj, _initial_angle) {
	_obj.direction = random_range(_initial_angle, _initial_angle + 50);
	_obj.speed = _obj.spd;
	_obj.gravity = _obj.spd_gravity;
	_obj.img_angle_spd = _obj.angle_spd;
}

