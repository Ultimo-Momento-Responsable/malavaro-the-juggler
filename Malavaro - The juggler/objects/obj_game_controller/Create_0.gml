/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
randomize()
sprite_depth = -10;
initial_seconds = 1;
spawn_time = random_range(60 * initial_seconds, 60 * (initial_seconds - 2));
timer = 0;
score_points = 0;
lives_left = 5;
has_throw_left = false;
has_throw_right = false;
global.score_points = 0;

life_bonus = false;
life_bonus_timer = 60;
percentage = 0;
anim_life_bonus = animcurve_get_channel(ac_throw_objects, "curve"); 

objects = [obj_contortionist, obj_elephant, obj_scimitar, obj_pin, obj_ball, obj_torch];
right_object = instance_create_depth(room_width - 110, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);	
right_object.position = 1;
left_object = instance_create_depth(94, 107, sprite_depth, objects[irandom(array_length(objects) - 1)]);
left_object.position = 0;
left_object.image_xscale = -1;
left_object.angle_spd *= -1;

animation_speed = 0.2;
animation_timer = 1 / animation_speed;
spr_score_frame = 0;

audio_stop_all();
audio_play_sound(snd_music, 0, true);
played_game_over_sound = false;

counter_ohh = 1;
ohh_sounds = [snd_ohh1, snd_ohh2, snd_ohh3]