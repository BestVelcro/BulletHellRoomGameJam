switch(gun_side){
	case 1:
	if(ds_exists(global.left_slots, ds_type_list)){
		if(ds_list_find_index(global.left_slots,y) == -1){
			ds_list_add(global.left_slots,y);
		}
	}
	break;
}

with(obj_particle){
	if(particle_owner == other.id){
		instance_destroy();	
	}
}
