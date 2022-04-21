var fire_buttom = keyboard_check(ord("Z"));
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
}

if(fire_buttom) and (can_fire) and (visible){
	can_fire = false;
	alarm[0] = room_speed/8;
	var bullet = instance_create_layer(x,y,"PlayerGun",obj_player_bullet);
	bullet.direction = image_angle;
	bullet.image_yscale = image_yscale;
	bullet.speed = 5;
	bullet.image_angle = bullet.direction;
	x_offset = lengthdir_x(8,image_angle+180);
	y_offset = lengthdir_y(8,image_angle+180);
}

x_offset = lerp(0,x_offset,0.5);
y_offset = lerp(0,y_offset,0.5);
