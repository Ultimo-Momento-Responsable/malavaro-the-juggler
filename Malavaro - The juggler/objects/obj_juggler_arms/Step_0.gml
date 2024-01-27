/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (place_meeting(x,y,obj_falling)) {
	percentage += 1/120;
	var _angle_curve = animcurve_channel_evaluate(idle_anim_angle, percentage);
	image_angle = (start_angle + _angle_curve * 100);
	if percentage >= 1 percentage = 0;
} else {
	image_angle = start_angle;
	percentage = 0;
}