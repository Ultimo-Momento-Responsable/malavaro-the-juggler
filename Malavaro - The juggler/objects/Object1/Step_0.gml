/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
with (other)
{
	var _density = random_range(0.1, 0.9);
	physics_set_density(fix_id, _density);
	
	var _force_x_sign = random_range(0, 1) > 0.5 ? 1 : -1;
	var _force_y_sign = random_range(0, 1) > 0 ? 1 : -1;
	
	var _force_x = random_range(600, 1200) * _force_x_sign;
	var _force_y = random_range(600, 1200) * _force_y_sign;

	
    physics_apply_force(x, y, _force_x, _force_y);
}