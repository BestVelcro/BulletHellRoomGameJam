x = room_width/2;
y = room_height/2;
hit = 0;
var number_of_guns_on_wall = global.gun_number_size/2;
var distance_between_guns = room_height/number_of_guns_on_wall;
gun_side = 0;
cannon_angle = 0;
startup = true;
x_startup_offset_support = sprite_width;
x_startup_offset_cannon = sprite_get_width(spr_gun_weapon)*2;
if(global.gun_number_current_size > 0){
if(global.gun_number_size/2 < global.gun_number_current_size){
	gun_side = 1;
	x = sprite_get_width(obj_wall);
	var current_guns = global.gun_number_current_size-(global.gun_number_size/2)
	y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-current_guns));
	global.gun_number_current_size--;
}else{
	gun_side = -1;
	cannon_angle = 180;
	image_xscale = -1;
	x = room_width-sprite_get_width(spr_wall);
	y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-global.gun_number_current_size));
	global.gun_number_current_size--;
}
if(instance_number(obj_enemy_gun) < global.gun_number_size){
	instance_create_layer(x,y,"Guns",obj_enemy_gun);	
}
}

aim_target = 0;
aim_current_direction = cannon_angle;
