if(trap_type == "LANDMINE"){
	exploded = true;
	obj_manager.shake_magnitude += obj_manager.shake_max_magnitude;
	var player_reach = instance_place(x,y,obj_player);
	if(player_reach != noone){
		DamageTaken(trap_damage, true, false);
		obj_manager.shake_magnitude += obj_manager.shake_max_magnitude/2;
	}
	repeat(30){
		explosion_offset_x = random_range(-sprite_width,sprite_width);
		explosion_offset_y = random_range(-sprite_width,sprite_width);
		var particle = instance_create_layer(x+explosion_offset_x,y+explosion_offset_y,choose("BottomParticles","TopParticles"),obj_particle);
		particle.direction = irandom(360);
		particle.speed = 5;
		particle.sprite_index = spr_landmine_hitbox;
		var size = random_range(0.3,0.5);
		particle.image_xscale = size;
		particle.image_yscale = size;
		particle.particle_owner = id;
		particle.green = 255;
		particle.blue = 255;
	}
	visible = false;
}

if(trap_type == "SPIKE"){
	image_speed = 1;
}
