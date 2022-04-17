x = room_width/2;
y = room_height/2;
hit = 0;
var number_of_guns_on_wall = global.gun_number_size/2;
var distance_between_guns = room_height/number_of_guns_on_wall;
gun_side = 0;
if(global.gun_number_current_size > 0){
if(global.gun_number_size/2 < global.gun_number_current_size){
	gun_side = 1;
	x = 0;
	var current_guns = global.gun_number_current_size-(global.gun_number_size/2)
	y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-current_guns));
	global.gun_number_current_size--;
}else{
	gun_side = -1;
	image_xscale = -1;
	x = room_width;
	y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-global.gun_number_current_size));
	global.gun_number_current_size--;
}
if(instance_number(obj_enemy_gun) < global.gun_number_size){
	instance_create_layer(x,y,"Guns",obj_enemy_gun);	
}
}
