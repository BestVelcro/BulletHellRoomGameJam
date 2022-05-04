switch(gun_side){
	case 1:
	if(ds_exists(global.left_slots, ds_type_list)){
		if(ds_list_find_index(global.left_slots,y) == -1){
			ds_list_add(global.left_slots,y);
		}
	}
	break;
	case -1:
	if(ds_exists(global.right_slots, ds_type_list)){
		if(ds_list_find_index(global.right_slots,y) == -1){
			ds_list_add(global.right_slots,y);
		}
	}
	break;
}
if(killed){
	repeat(coin_amount*global.coin_multiplier){
	var coin = instance_create_layer(x+(gun_side*10),y,"BottomParticles",obj_coin);	
	coin.v_speed -= random(1);
	}
}

with(obj_particle){
	if(particle_owner == other.id){
		instance_destroy();	
	}
}
