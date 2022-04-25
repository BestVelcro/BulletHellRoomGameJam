////// Dealing with items

var my_items_size = ds_list_size(my_items)-1;

repeat(my_items_size+1){
	var current_item_id = ds_list_find_value(my_items,my_items_size);
	my_items_size--;
	if(global.items_array[current_item_id][4]){
		OnStep(current_item_id);
	}
	if(global.items_array[current_item_id][5]){
		var ds_index = 0;
		repeat(ds_list_size(clock_items)){
			var clock_array = ds_list_find_value(clock_items,ds_index);
			var clock_id = array_get(clock_array, 0);
			var clock_time = array_get(clock_array, 1);
			
			if(clock_id == current_item_id){
				var clock = OnClock(current_item_id, clock_time);
				var item_clock = [current_item_id, clock];
				ds_list_set(clock_items,ds_index,item_clock);
				break;
			}
			
			ds_index++;
		}
	}
}


