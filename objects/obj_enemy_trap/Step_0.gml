if(trap_type == "LANDMINE"){
	
	// Trigger explosion time
	if(place_meeting(x,y,obj_player)) and (!trigger){
	trigger = true;
	alarm[0] = room_speed/2;
	image_index = 1;
	mask_index = spr_landmine_hitbox;
	}

// Deal with particles
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

if(trap_type == "SPIKE"){
	if(place_meeting(x,y,obj_player)) and (sprite_index == spr_spike){
		image_speed = 1;
	}
}
show_debug_message(string(spin_plataform));
if(trap_type == "BLADE") and (instance_exists(spin_plataform)){
	created = true;
	image_angle += 31
	
	var x_direction = lengthdir_x(speed,direction);
	var y_direction = lengthdir_y(speed,direction);
	if(x+x_direction > spin_plataform.x+spin_plataform.sprite_width/2) or (x+x_direction < spin_plataform.x-spin_plataform.sprite_width/2) or (y+y_direction > spin_plataform.y+spin_plataform.sprite_height/2) or (y+y_direction < spin_plataform.y-spin_plataform.sprite_height/2){
		direction -= 90;
	}
}else if(created){
	instance_destroy();	
}
