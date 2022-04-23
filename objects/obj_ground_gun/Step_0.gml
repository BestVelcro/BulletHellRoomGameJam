hit = lerp(0,hit,0.2);

if(sniper_angle > 90) and (sniper_angle < 270) sniper_yscale = -1; else sniper_yscale = 1;

if(instance_exists(obj_player)) player_direction = point_direction(x,y-sprite_height,obj_player.x,obj_player.y);

if(!lock) and (abs(angle_difference(player_direction,sniper_angle)) > 1) and (!get_out) sniper_angle += sign(angle_difference(player_direction,sniper_angle))*2;

if(!get_out) and (startup){
	y_offset = clamp(y_offset - 1,0,y_default_offset);
	if(y_offset <= 1){
	startup = false;
	y_offset = 0;
	}
}

if(y_offset <= 1) lock = false;

if(sniper_angle > 360) sniper_angle = 0;
if(sniper_angle < 0) sniper_angle = 360;

///////////////////////

if(get_out) and (abs(sniper_angle-90) > 5){
sniper_angle += sign(angle_difference(90,sniper_angle))*4;
}

descending = false;
if(get_out) and (abs(sniper_angle-90) <= 5){
descending = true;
y_offset++;
if(y_offset >= y_default_offset+sprite_get_width(spr_gun_sniper)) instance_destroy();
}

if(can_shoot) and (!get_out) and (abs(angle_difference(player_direction,sniper_angle)) < 22) and (y_offset < 1){
	can_shoot = false;
	alarm[0] = room_speed*1.5;
	var bullet = instance_create_layer(x,y+y_offset-sprite_width,"PlayerGun",obj_enemy_bullet);
	bullet.sprite_index = spr_bullet_sniper;
	bullet.direction = sniper_angle;
	bullet.speed = 15;
	bullet.image_angle = sniper_angle;
	bullet.bullet_damage = gun_damage;
	x_recoil = lengthdir_x(14,sniper_angle+180);
	y_recoil = lengthdir_y(14,sniper_angle+180);
}

x_recoil = lerp(0,x_recoil,0.5);
y_recoil = lerp(0,y_recoil,0.5);

if(turret_health <= 0) and (!get_out){
	get_out = true;
	killed = true;
}
