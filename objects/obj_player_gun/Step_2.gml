#macro cannon_size 4
fire_buttom = keyboard_check(ord("Z"));
var sides_horizontal = keyboard_check(vk_right)-keyboard_check(vk_left);
var sides_vertical = keyboard_check(vk_down)-keyboard_check(vk_up);

if(instance_exists(obj_player)){
	var weapon_get_offset_x = sprite_get_xoffset(spr_player_gun)-6;
	var weapon_get_offset_y = sprite_get_yoffset(spr_player_gun)-8;
	
	var weapon_offset_direction = point_direction(0,0,weapon_get_offset_x,weapon_get_offset_y);
	var weapon_offset_distance = point_distance(0,0,4,5);
	
	var weapon_offset_x = lengthdir_x(weapon_offset_distance,weapon_offset_direction);
	var weapon_offset_y = lengthdir_y(weapon_offset_distance,weapon_offset_direction);
	x = obj_player.x+x_offset+(image_yscale*weapon_offset_x);
	y = obj_player.y+y_offset+weapon_offset_y;
	if(sides_horizontal != 0){
		image_yscale = sides_horizontal;
		image_angle = point_direction(0,0,sides_horizontal,sides_vertical);
	}
	visible = obj_player.visible;

if(fire_buttom) and (can_fire) and (visible){
	audio_sound_gain(sub_gunshot,0.1,1);
	audio_play_sound(sub_gunshot,1,false);
	fired = true;
	var bullet_space = cannon_size/bullet_count;
	var bullet_start = bullet_space/2;
	var spread_angle = random_range(-spread,spread);
	
	can_fire = false;
	alarm[0] = fire_rate;
	repeat(bullet_count){
	var barrel_dirx = lengthdir_x(cannon_size/2,image_angle-90);
	var barrel_diry = lengthdir_y(cannon_size/2,image_angle-90);
	
	var bullet_dirx = lengthdir_x(bullet_start,image_angle+90)+barrel_dirx;
	var bullet_diry = lengthdir_y(bullet_start,image_angle+90)+barrel_diry;
	
	var bullet = instance_create_layer(x+bullet_dirx,y+bullet_diry,"PlayerGun",bullet_shot);
	bullet.direction = image_angle+spread_angle;
	bullet.image_yscale = image_yscale;
	bullet.speed = bullet_speed;
	bullet.hspeed += obj_player.hs_speed/2;
	bullet.image_angle = bullet.direction;
	bullet.damage = base_damage+global.player_damage;
	bullet_start += bullet_space
	}
	x_offset = lengthdir_x(8,image_angle+180);
	y_offset = lengthdir_y(8,image_angle+180);
}

x_offset = lerp(0,x_offset,0.5);
y_offset = lerp(0,y_offset,0.5);

}
