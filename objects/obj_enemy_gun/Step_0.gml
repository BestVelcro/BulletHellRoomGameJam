hit = lerp(0,hit,0.2);

if(instance_exists(obj_player)){
	aim_target = point_direction(x,y,obj_player.x,obj_player.y);
	if(laser_gun) aim_target = laser_endpoint;
}else{
aim_target = cannon_angle;
}
if(!get_out) and (abs(angle_difference(aim_target,aim_current_direction)) > 1) aim_current_direction += sign(angle_difference(aim_target,aim_current_direction))*cannon_speed;

if(startup){
x_startup_offset_support = lerp(0,x_startup_offset_support,0.9);
x_startup_offset_cannon = lerp(0,x_startup_offset_cannon,0.9);
aim_current_direction = cannon_angle;
if(x_startup_offset_cannon <= 1) and (x_startup_offset_support <= 1){
	startup = false;
}
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
	bullet.homing = can_home
	if(bullets_fired >= bullet_limit){
		get_out = true;
	}
}

if(laser_gun){
var max_length = room_width*2;

for(i = 0; i < max_length; i++){
    final_x = x+lengthdir_x(sprite_get_width(spr_gun_support)/2,aim_current_direction) + lengthdir_x(i, aim_current_direction);
    final_y = y + lengthdir_y(i, aim_current_direction);

    length_laser = i;
    
    if(position_meeting(final_x,final_y, obj_wall)){
		length_laser++;
       break;
    }
}
if(abs(angle_difference(aim_target,aim_current_direction)) > gun_precision){
	length_laser = 0;
}else{
laser_startup = lerp(1,laser_startup,0.8);
}
}

if(aim_current_direction > 90) and (aim_current_direction < 270) image_yscale = -1; else image_yscale = 1;
if(aim_current_direction > 360) aim_current_direction = 0;
if(aim_current_direction < 0) aim_current_direction = 360;
