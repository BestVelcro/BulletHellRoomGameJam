if(global.current_state == "SHOP") and (!show){
	show = true;
	sprite_index = spr_buttom_end;
	image_speed = 1;
	image_index = 0;
}
if(place_meeting(x,y,obj_player)) and (keyboard_check_pressed(ord("Z"))) and (global.current_state == "SHOP") and (show){
	sprite_index = spr_buttom_starts;
	image_speed = 1;
	image_index = 0;
	global.current_state = "WAIT_TIME";
	global.time = room_speed;
	global.clock = false;
	show = false;
}
