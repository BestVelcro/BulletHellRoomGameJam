if(keyboard_check_pressed(ord("Z"))) and (place_meeting(x,y,obj_player)) and (global.coins >= global.items_array[random_item][6]){
global.coins -= global.items_array[random_item][6];
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
instance_destroy();
}

if(!get_out){
	sprite_show = clamp(sprite_show + 1,0,sprite_height);
	alpha = clamp(alpha+alpha_increase,0,1);
}else{
	sprite_show--;	
	alpha -= alpha_increase;
	if(sprite_show <= 0) instance_destroy();
}
