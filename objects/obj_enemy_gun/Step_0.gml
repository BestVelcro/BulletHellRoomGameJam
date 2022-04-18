hit = lerp(0,hit,0.2);

if(instance_exists(obj_player)) aim_target = point_direction(x,y,obj_player.x,obj_player.y); else aim_target = cannon_angle;
if(!get_out) aim_current_direction += sign(angle_difference(aim_target,aim_current_direction))*cannon_speed;

if(startup){
x_startup_offset_support = lerp(0,x_startup_offset_support,0.9);
x_startup_offset_cannon = lerp(0,x_startup_offset_cannon,0.9);
aim_current_direction = cannon_angle;
if(x_startup_offset_cannon <= 1) and (x_startup_offset_support <= 1){
	startup = false;
}
}

if(get_out) and (aim_current_direction != cannon_angle){
aim_current_direction += sign(angle_difference(cannon_angle,aim_current_direction));
}

if(get_out) and (abs(aim_current_direction-cannon_angle) < 5){
x_startup_offset_support++;
x_startup_offset_cannon += 2;
if(x_startup_offset_cannon >= default_cannon_x) instance_destroy();
}

if(can_shoot) and (!get_out){
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
