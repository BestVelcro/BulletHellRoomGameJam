view_enabled = true;
view_visible[0] = true;

	global.items_on_play = [];
	var i = 0;
	repeat(array_length(global.items_array)){
	array_copy(global.items_on_play,i,global.items_array[i],7,1);
	i++
	}
	
room_goto_next();
