/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
initial_seconds = 4;
spawn_time = random_range(60 * initial_seconds, 60 * (initial_seconds - 2));
timer = 0;
score_points = 0;
sprites_offset = 120;

objects = [obj_contortionist, obj_elephant, obj_scimitar, obj_pin, obj_ball];
right_object = instance_create_depth(room_width - sprites_offset, sprites_offset, 0, objects[irandom(array_length(objects) - 1)]);
left_object = instance_create_depth(sprites_offset, sprites_offset, 0, objects[irandom(array_length(objects) - 1)]);

