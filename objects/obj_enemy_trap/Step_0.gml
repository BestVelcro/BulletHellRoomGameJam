if(trap_type == "LANDMINE") and (place_meeting(x,y,obj_player)) and (!trigger){
	trigger = true;
	alarm[0] = room_speed/2;
	image_index = 1;
	mask_index = spr_landmine_hitbox;
}

with(obj_particle){
	if(particle_owner == other.id){
		speed = lerp(0,speed,0.95)
		image_alpha -= random(1)/20;
	}
}
