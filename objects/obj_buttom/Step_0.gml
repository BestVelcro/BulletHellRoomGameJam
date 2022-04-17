if(global.current_state == "SHOP") and (!show){
	show = true;
	visible = true;
}
if(place_meeting(x,y,obj_player)) and (keyboard_check_pressed(ord("Z"))){
	image_speed = 1;
	global.current_state = "WAIT_TIME";
	global.time = room_speed;
	global.clock = false;
}
