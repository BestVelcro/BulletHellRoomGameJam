var current_items = ds_list_create();
with(obj_item_shop){
	//if(variable_instance_exists(id, "random_item")){
	ds_list_add(current_items,random_item);	
	//}
}

var new_item = false;

while(!new_item){
random_item = irandom(array_length(global.items_array)-1);
new_item = true;
var looking_item = 0;
repeat(ds_list_size(current_items)){
	var item_id = ds_list_find_value(current_items, looking_item);
	if(item_id == random_item){
		new_item = false;	
	}
	//looking_item++;
	if(looking_item > ds_list_size(current_items)) break;
}
}

ds_list_destroy(current_items);
