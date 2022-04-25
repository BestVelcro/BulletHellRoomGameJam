hit = lerp(0,hit,0.2);

if(instance_exists(obj_player)){
	aim_target = point_direction(x,y,obj_player.x,obj_player.y);
	if(laser_gun) aim_target = laser_endpoint;
}else{
aim_target = cannon_angle;
}
if(!get_out) and (abs(angle_difference(aim_target,aim_current_direction)) > 1) aim_current_direction += sign(angle_difference(aim_target,aim_current_direction))*cannon_speed;

if(startup) and (!get_out){
x_startup_offset_support = lerp(0,x_startup_offset_support,0.9);
x_startup_offset_cannon = lerp(0,x_startup_offset_cannon,0.9);
aim_current_direction = cannon_angle;
if(x_startup_offset_cannon <= 1) and (x_startup_offset_support <= 1){
	startup = false;
}
}else{
	startup = false	
}

if(get_out) and (abs(angle_difference(cannon_angle,aim_current_direction)) > 4){
aim_current_direction += sign(angle_difference(cannon_angle,aim_current_direction));
laser_startup++;
}

if(get_out) and (abs(angle_difference(cannon_angle,aim_current_direction)) < 5){
x_startup_offset_support++;
x_startup_offset_cannon += 2;
if(x_startup_offset_cannon >= default_cannon_x) instance_destroy();
}

if(can_shoot) and (!get_out) and (!startup) and (abs(angle_difference(aim_target,aim_current_direction)) <= gun_precision) and (!laser_gun){
	audio_sound_gain(audio_play,0.2,1);
	audio_sound_pitch(audio_play,1+(random_range(-1,1)/8));
	audio_play_sound(audio_play,1,false);
	bullets_fired++;
	image_index = 0;
	image_speed = 1;
	can_shoot = false;
	alarm[0] = cooldown;
	var bullet_offset_x = lengthdir_x(5,aim_current_direction+random_range(projectile_offset[0]*2,projectile_offset[1]*2));
	var bullet_offset_y = lengthdir_y(5,aim_current_direction+random_range(projectile_offset[0]*2,projectile_offset[1]*2));
	var bullet = instance_create_layer(x+bullet_offset_x,y+bullet_offset_y,"PlayerGun",obj_enemy_bullet);
	bullet.sprite_index = bullet_sprite;
	bullet.direction = aim_current_direction+random_range(projectile_offset[0],projectile_offset[1]);
	bullet.speed = projectile_speed;
	bullet.image_angle = bullet.direction;
	bullet.homing = can_home;
	bullet.bullet_damage = gun_damage;
	if(bullets_fired >= bullet_limit){
		get_out = true;
	}
}else{

}

if(laser_gun) and (!startup){
var max_length = room_width*2;

for(i = 0; i < max_length; i++){
    final_x = x+lengthdir_x(sprite_get_width(spr_gun_support)/2,aim_current_direction) + lengthdir_x(i, aim_current_direction);
    final_y = y + lengthdir_y(i, aim_current_direction);

    length_laser = i;
    
    if(position_meeting(final_x,final_y, obj_wall)) or (position_meeting(final_x,final_y,obj_player_orbital)){
		length_laser++;
       break;
    }
}
if(abs(angle_difference(aim_target,aim_current_direction)) > 1){
	length_laser = 0;
}else{
laser_startup = lerp(1,laser_startup,0.8);
}

if(!instance_exists(obj_sensor)) instance_create_layer(0,0,"Cenario", obj_sensor);

obj_sensor.x = x;
obj_sensor.y = y;
obj_sensor.image_angle = aim_current_direction;
obj_sensor.image_xscale = length_laser;
obj_sensor.image_yscale = sprite_get_height(spr_bullet_laser);

//Collision Detection
with(obj_sensor){
	/*
    if(place_meeting(x,y,obj_sensor)){
		DamageTaken(other.gun_damage,false,4);
    }
	*/
	var dir_x = 0;
	var dir_y = 0;
	var laser_length = 0;
	repeat(image_xscale){
		if(position_meeting(x+dir_x,y+dir_y,obj_player)) and (!other.get_out){
			DamageTaken(other.gun_damage,false,4);
			repeat(5){
				var particle = instance_create_layer(x+dir_x,y+dir_y,"TopParticles",obj_particle);
				particle.x += random_range(-3,3);
				particle.y += random_range(-3,3);
				particle.sprite_index = spr_bullet_laser_particle;
				particle.direction = irandom(360);
				particle.speed = random(3)+1;
				particle.image_speed = 1;
				particle.image_index = irandom(particle.image_number-1);
				particle.image_color = choose(c_white,c_yellow,c_red);
				particle.particle_owner = other.id;
			}
			break;
		}
		laser_length++;
		dir_x = lengthdir_x(laser_length,image_angle);
		dir_y = lengthdir_y(laser_length,image_angle);
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

}

if(turret_health <= 0) and (!get_out) and (!startup) and (!killed){
	audio_sound_gain(turrent_breaking_down,0.1,0);
	audio_play_sound(turrent_breaking_down,1,false);
	get_out = true;
	killed = true;
}

if(aim_current_direction > 90) and (aim_current_direction < 270) image_yscale = -1; else image_yscale = 1;
if(aim_current_direction > 360) aim_current_direction = 0;
if(aim_current_direction < 0) aim_current_direction = 360;
