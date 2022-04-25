if(trap_type == "LANDMINE"){
	
	// Trigger explosion time
	if(place_meeting(x,y,obj_player)) and (!trigger) and (up_to) and (global.traps) and (!get_out){
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
	if(place_meeting(x,y,obj_player)) and (up_to) and (global.traps) and (!get_out){
		if(sprite_index == spr_spike) image_speed = 1;
		if(sprite_index == spr_spike) and (image_index == image_number-1) and (global.traps){
			DamageTaken(trap_damage,false,false);
		}
		if(sprite_index == spr_spike_retract) and (image_index == 0) and (global.traps){
			DamageTaken(trap_damage,false,false);
		}
	}
	
}

if(trap_type == "BLADE") and (instance_exists(spin_plataform)){
	created = true;
	image_angle += 20;
	if(place_meeting(x,y,obj_player)) and (!get_out) and (global.traps) DamageTaken(trap_damage,false,2);
	var x_direction = lengthdir_x(speed,direction);
	var y_direction = lengthdir_y(speed,direction);
	if(x+x_direction > spin_plataform.x+spin_plataform.sprite_width/2) or (x+x_direction < spin_plataform.x-spin_plataform.sprite_width/2) or (y+y_direction > spin_plataform.y+spin_plataform.sprite_height/2) or (y+y_direction < spin_plataform.y-spin_plataform.sprite_height/2){
		direction -= 90;
	}
	
	// Blade Enter and Leave Animation
	audio_sound_gain(spinning_razors,clamp(blade_size/8,0,0.2),1);
	if(spin_plataform.sprite_index == spr_plataform_close){
	blade_size = clamp(blade_size-0.05,0,1);
	if(blade_size <= 0){
		instance_destroy();	
		audio_stop_sound(spinning_razors);
	}
	}else{
	blade_size = clamp(blade_size+0.05,0,1);
	}
	image_xscale = blade_size;
	image_yscale = blade_size;
	
}else if(created){
	audio_stop_sound(spinning_razors);
	instance_destroy();	
}else{
x = lock_x;
y = lock_y+y_offset;
if(!get_out) y_offset = clamp(y_offset - 1,0,y_offset); else y_offset++;
if(get_out) and (y_offset > sprite_get_height(spr_wall)) instance_destroy();
if(y_offset <= 0) and (!trap_set){
	trap_set = true;
	alarm[2] = room_speed;	
}
}
