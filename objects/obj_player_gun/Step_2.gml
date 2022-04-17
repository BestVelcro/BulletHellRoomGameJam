var fire_buttom = keyboard_check(ord("Z"));
var sides_horizontal = keyboard_check(vk_right)-keyboard_check(vk_left);
var sides_vertical = keyboard_check(vk_down)-keyboard_check(vk_up);

if(instance_exists(obj_player)){
	x = obj_player.x+x_offset;
	y = obj_player.y+y_offset;
	if(sides_horizontal != 0){
		image_yscale = sides_horizontal;
		image_angle = point_direction(0,0,sides_horizontal,sides_vertical);
	}
}

if(fire_buttom) and (can_fire){
	can_fire = false;
	alarm[0] = room_speed/8;
	var bullet = instance_create_layer(x,y,"PlayerGun",obj_player_bullet);
	bullet.direction = image_angle;
	bullet.speed = 5;
	bullet.image_angle = bullet.direction;
	x_offset = lengthdir_x(5,image_angle+180);
	y_offset = lengthdir_y(5,image_angle+180);
}

x_offset = lerp(0,x_offset,0.5);
y_offset = lerp(0,y_offset,0.5);
