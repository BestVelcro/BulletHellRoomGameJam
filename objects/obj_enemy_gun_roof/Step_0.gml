hit = lerp(0,hit,0.2);
var aim_target_difference = angle_difference(aim_target,aim_current_direction);
var angle_move = sign(aim_target_difference)*cannon_speed

if(instance_exists(obj_player)){
	aim_target = point_direction(x,y,obj_player.x,obj_player.y);
}else{
aim_target = cannon_angle;
}
if(!get_out) and (abs(aim_target_difference) > 1) and (aim_current_direction+angle_move-(90-starting_gun) > 180) and (aim_current_direction+angle_move+(90-starting_gun) < 360){
	aim_current_direction += angle_move;
}

if(startup) and (!get_out){
y_startup_offset_support = lerp(0,y_startup_offset_support,0.9);
y_startup_offset_cannon = lerp(0,y_startup_offset_cannon,0.9);
aim_current_direction = cannon_angle;
if(y_startup_offset_cannon <= 1) and (y_startup_offset_support <= 1){
	startup = false;
}
}else{
	startup = false;	
}

if(get_out) and (abs(angle_difference(cannon_angle,aim_current_direction)) > 4){
aim_current_direction += sign(angle_difference(cannon_angle,aim_current_direction));
}

if(get_out) and (abs(angle_difference(cannon_angle,aim_current_direction)) < 5){
y_startup_offset_support++;
y_startup_offset_cannon += 2;
if(y_startup_offset_cannon >= default_cannon_x) instance_destroy();
}

if(can_shoot) and (!get_out) and (!startup) and (abs(aim_target_difference) <= gun_precision){
	barrage_count--;
	image_index = 0;
	image_speed = 1;
	can_shoot = false;
	if(barrage_count > 0){
	alarm[0] = cooldown/8;
	}else{
	barrage_count = barrage;
	alarm[0] = cooldown;
	}
	var bullet_angle = starting_gun;
	repeat(number_of_bullets){
	var bullet = instance_create_layer(x+cannon_x,y+cannon_y,"PlayerGun",obj_enemy_bullet);
	bullet.sprite_index = bullet_sprite;
	bullet.direction = aim_current_direction+(90-bullet_angle);
	bullet.speed = projectile_speed;
	bullet.image_angle = bullet.direction;
	bullet_angle += angle_offset;
	bullet.bullet_damage = gun_damage;
	}
}

if(turret_health <= 0) and (!get_out){
	get_out = true;
	killed = true;
}

if(aim_current_direction > 90) and (aim_current_direction < 270) image_yscale = -1; else image_yscale = 1;
if(aim_current_direction > 360) aim_current_direction = 0;
if(aim_current_direction < 0) aim_current_direction = 360;
