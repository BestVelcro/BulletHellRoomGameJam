if(keyboard_check_pressed(ord("Z"))) and (place_meeting(x,y,obj_player)){
if(global.items_array[random_item][3]){
	with(obj_player){
	OnPickup(other.random_item);
	}
}
if(global.items_array[random_item][5]){
	with(obj_player){
	var item_clock = [other.random_item, 0];
	ds_list_add(clock_items, item_clock);
	}
}
bough = true;
ds_list_add(obj_player.my_items, random_item);
show_debug_message(string(global.items_on_play));
instance_destroy();
}