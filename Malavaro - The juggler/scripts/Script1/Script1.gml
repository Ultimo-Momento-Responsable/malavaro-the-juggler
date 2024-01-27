// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function spawn_object(){
	var _position = floor(irandom_range(0, 1));
	var _random_child = objects[irandom(array_length(objects) - 1)];
	var _obj = instance_create_depth(_position * room_width, 64, 0, _random_child);
	_obj.direction = _position == 0 ? random_range(0,30) : random_range(150, 180);
	return random_range(60 * initial_seconds, 60 * (initial_seconds - 2));
}