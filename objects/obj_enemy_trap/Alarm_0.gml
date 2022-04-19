if(trap_type == "LANDMINE"){
	var player_reach = instance_place(x,y,obj_player);
	if(player_reach != noone){
		global.player_hp -= 80;
	}
	repeat(30){
		explosion_offset_x = random_range(-sprite_width,sprite_width);
		explosion_offset_y = random_range(-sprite_width,sprite_width);
		var particle = instance_create_layer(x+explosion_offset_x,y+explosion_offset_y,"Guns",obj_particle);
		particle.direction = irandom(360);
		particle.speed = 5;
		particle.sprite_index = spr_landmine_hitbox;
		particle.image_xscale = 0.5;
		particle.image_yscale = 0.5;
		particle.particle_owner = id;
	}
	/*
	explosion = sprite_get_width(spr_landmine_hitbox)/2;
	explosion_direction = irandom(360);
	i = 1;
	*/
}

