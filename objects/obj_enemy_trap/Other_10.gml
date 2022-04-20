switch(trap_type){
	case "LANDMINE":
	sprite_index = spr_landmine;
	break;
	case "SPIKE":
	sprite_index = spr_spike;
	break;
	case "BLADE":
	sprite_index = spr_blade;
	var ds_plataform = ds_list_create();
	with(obj_plataform){
		if(visible){
		ds_list_add(ds_plataform,id);	
		}
	}
	spin_plataform = ds_list_find_value(ds_plataform,irandom(ds_list_size(ds_plataform)-1));
	show_debug_message(string(spin_plataform));
	if(ds_list_size(ds_plataform) > 1){
	x = spin_plataform.bbox_left;
	y = spin_plataform.bbox_top;
	direction = 0;
	speed = 0.5;
	}
	break;
}
