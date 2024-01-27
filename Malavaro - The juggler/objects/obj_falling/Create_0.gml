/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
gravity_direction = 270;
spd = random_range(5, 20);
spd_gravity = 0.7;
img_angle_spd = 0;
image_speed = 0.2;
score_points = 100;
bounces = 0;
curve_y = animcurve_get_channel(ac_balance_object, "curveY");
curve_x = animcurve_get_channel(ac_balance_object, "curveX");
is_iddle = true;
percentage = 0;
start_position = [x, y];
timer = irandom_range(120, 240);
position = 0;