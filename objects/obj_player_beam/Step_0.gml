var max_length = room_width*2;

for(i = 0; i < max_length; i++){
    final_x = x + lengthdir_x(i, direction);
    final_y = y + lengthdir_y(i, direction);

    length_laser = i;
    
    if(position_meeting(final_x,final_y, obj_wall)){
		length_laser++;
       break;
    }
}



if(instance_exists(obj_player)){
	x = obj_player.x;
	y = obj_player.y-(obj_player.sprite_height/2+obj_player.sprite_height/4);
}

if(!instance_exists(obj_sensor)) instance_create_layer(0,0,"Cenario", obj_sensor);

obj_sensor.x = x;
obj_sensor.y = y;
obj_sensor.image_angle = direction;
obj_sensor.image_xscale = length_laser;
obj_sensor.image_yscale = sprite_height/sprite_get_height(spr_bullet_laser);
show_debug_message(string(obj_sensor.image_yscale));

//Collision Detection
with(obj_sensor){
with(obj_enemy_gun){
	if(place_meeting(x,y,obj_sensor)){
	if(!get_out) and (!startup){
	hit = 0.5;
	turret_health -= 5+floor(global.player_damage/4);
	}
	}
}
with(obj_enemy_gun_roof){
	if(place_meeting(x,y,obj_sensor)){
		if(!get_out) and (!startup){
		hit = 0.5;
		turret_health -= 5+floor(global.player_damage/4);
		}
	}
}
}

// Deal with particles
var particle_instances = ds_list_create();
with(obj_particle){
	if(particle_owner == other.id) ds_list_add(particle_instances,id);
}

var particle_pos = 0;
repeat(ds_list_size(particle_instances)){
	var particle_id = ds_list_find_value(particle_instances,particle_pos);
	
	particle_id.speed -= particle_id.speed/(irandom(2)+1+(irandom(1)*10))//lerp(0,particle_id.speed,0.9);
	particle_id.image_alpha -= irandom(1)/10;
	
	if(particle_id.image_alpha <= 0) instance_destroy(particle_id);
	particle_pos++;
}

ds_list_destroy(particle_instances);

direction += 0.5;
