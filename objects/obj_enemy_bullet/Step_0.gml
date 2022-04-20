if(homing) and (instance_exists(obj_player)){
	var player_direction = point_direction(x,y,obj_player.x,obj_player.y);
	direction += sign(angle_difference(player_direction,direction));
	image_angle = direction;
}

if(sprite_index == spr_bullet_rpg){
var particle_instances = ds_list_create();
with(obj_particle){
	if(particle_owner == other.id) ds_list_add(particle_instances,id);
}

if(exploded) and (ds_list_size(particle_instances) <= 0) instance_destroy();

var particle_pos = 0;
repeat(ds_list_size(particle_instances)){
	var particle_id = ds_list_find_value(particle_instances,particle_pos);
	
	particle_id.x += random_range(-1,1);
	particle_id.y += random_range(-1,1);
	
	particle_id.speed = lerp(0,particle_id.speed, 0.9)
	particle_id.image_alpha -= random(1)/20;
	particle_id.image_color = make_color_rgb(255,particle_id.green,particle_id.blue);
	if(particle_id.blue > 0) particle_id.blue = clamp(particle_id.blue - random(30), 0, 255);else particle_id.green = clamp(particle_id.green - 10, 0, 255);
	if(particle_id.image_alpha <= 0) instance_destroy(particle_id);
	particle_pos++;
}

ds_list_destroy(particle_instances);	
}
