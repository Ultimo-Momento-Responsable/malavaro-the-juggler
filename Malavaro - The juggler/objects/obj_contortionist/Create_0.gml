/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
event_inherited();
img_angle_spd = 0;
angle_spd = 12;
score_points = 100;
sprite_index = asset_get_index("spr_contortionist" + string(irandom_range(1,3)));
distance_animation = 40;

throw_sound = snd_acrobat;
fall_sound = snd_acrobat_fall;