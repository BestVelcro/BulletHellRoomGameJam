if(global.current_state == "FINAL") and (!show){
	show = true;
	sprite_index = spr_buttom_end;
	image_speed = 1;
	image_index = 0;
}
if(place_meeting(x,y,obj_player)) and (keyboard_check_pressed(ord("Z"))) and (global.current_state == "FINAL") and (show){
	global.items_on_play = [];
	var i = 0;
	repeat(array_length(global.items_array)){
	array_copy(global.items_on_play,i,global.items_array[i],7,1);
	i++
	}
	sprite_index = spr_buttom_starts;
	image_speed = 1;
	image_index = 0;
	global.current_state = "WAIT_TIME";
	global.current_round = 1;
	if(instance_exists(obj_plataform)) obj_plataform.closes = true;;
	global.time = room_speed;
	global.clock = false;
	show = false;
}
