var horizontal_speed = keyboard_check(vk_right)-keyboard_check(vk_left);
var jump = keyboard_check(vk_space);
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

on_floor = false;
can_jump--;

var onWall = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+1,obj_wall,false,false);
if(onWall != noone){
	vs_speed = jump*-jump_power;
	if(!jump) can_jump = jump_buffer; else can_jump = 0;
	on_floor = true;
}

var onPlataform = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+vs_speed,obj_plataform,false,false);
if(onPlataform != noone) and (!can_fall) and (vs_speed > 0){
	if(onPlataform.image_index == onPlataform.image_number-1) and (onPlataform.visible){
	var clipping = instance_place(x,y,obj_plataform);
	if(clipping != noone){
		if(onPlataform != clipping){
			vs_speed = jump*-jump_power;
			if(!jump) can_jump = jump_buffer; else can_jump = 0;
			on_floor = true;
		}
	}else{
	vs_speed = jump*-jump_power;
	if(!jump) can_jump = jump_buffer; else can_jump = 0;
	on_floor = true;
	}
	}
}

if(can_jump > 0) and (!on_floor) and (jump){
	can_jump = 0;
	vs_speed = jump*-jump_power;
	show_debug_message("Jumped with jump buffer");
}

y += vs_speed; 

if(horizontal_speed != 0) and (!lock){
	sprite_index = spr_player_walking;
}else if(hs_speed < hs_max_speed){
	sprite_index = spr_player_slowing;
	if(hs_speed < 1) sprite_index = spr_player_stop;
}

if(vs_speed < 0) sprite_index = spr_player_up;
if(vs_speed > 0) sprite_index = spr_player_down;














