var horizontal_speed = keyboard_check(ord("D"))-keyboard_check(ord("A"));
var jump = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

hs_speed = lerp(hs_speed, 0, deccel);

if(horizontal_speed != 0){
	hs_speed = lerp(hs_speed, hs_max_speed*horizontal_speed, accel);
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

var onWall = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_wall,false,false);
if(onWall != noone){
	vs_speed = jump*-jump_power;
}

y += vs_speed; 
