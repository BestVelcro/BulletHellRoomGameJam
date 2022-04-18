var horizontal_speed = keyboard_check(vk_right)-keyboard_check(vk_left);
var jump = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);
var lock = keyboard_check(ord("C"));
jump = jump*(!lock);

if(key_down and !can_fall and !lock){
	can_fall = true;
	alarm[0] = room_speed/4;
}

hs_speed = lerp(hs_speed, 0, deccel);

if(horizontal_speed != 0){
	if(!lock) hs_speed = lerp(hs_speed, hs_max_speed*horizontal_speed, accel);
	image_xscale = horizontal_speed;
}

if(place_meeting(x+hs_speed,y,obj_wall)){
	x = round(x);
	while(!place_meeting(x+sign(hs_speed),y,obj_wall)){
		show_debug_message(string(x));
		x += sign(hs_speed);
	}
	hs_speed = 0;
}

x += hs_speed;

vs_speed += grv;

//Vertical Collision
if(place_meeting(x,y+vs_speed,obj_wall)){
	y = round(y);
	while(!place_meeting(x,y+sign(vs_speed),obj_wall)){
		y += sign(vs_speed);
	}
	vs_speed = 0;
}

var onWall = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+1,obj_wall,false,false);
if(onWall != noone){
	vs_speed = jump*-jump_power;
}

var onPlataform = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+vs_speed,obj_plataform,false,false);
if(onPlataform != noone) and (!can_fall) and (vs_speed > 0){
	if(onPlataform.image_index == onPlataform.image_number-1) and (onPlataform.visible){
	var clipping = instance_place(x,y,obj_plataform);
	if(clipping != noone){
		if(onPlataform != clipping){
			vs_speed = jump*-jump_power;
		}
	}else{
	vs_speed = jump*-jump_power;
	}
	}
}
y += vs_speed; 
















