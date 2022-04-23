	speed = 0;
	visible = false;
	
	repeat(30){
		explosion_offset_x = random_range(-sprite_width,sprite_width);
		explosion_offset_y = random_range(-sprite_width,sprite_width);
		var particle = instance_create_layer(x+explosion_offset_x,y+explosion_offset_y,choose("BottomParticles","TopParticles"),obj_particle);
		particle.direction = irandom(360);
		particle.speed = 5;
		particle.sprite_index = spr_landmine_hitbox;
		var size = random_range(0.2,0.3);
		particle.image_xscale = size;
		particle.image_yscale = size;
		particle.particle_owner = id;
		particle.green = 255;
		particle.blue = 255;
	}
	
	exploded = true;
	
	mask_index = spr_landmine_hitbox;
	image_xscale = 0.75;
	image_yscale = 0.75;
	
with(obj_enemy_gun){
	if(place_meeting(x,y,obj_player_grenade)){
	if(!get_out) and (!startup){
	hit = 1;
	turret_health -= other.damage;
	}
	}
}
with(obj_enemy_gun_roof){
	if(place_meeting(x,y,obj_player_grenade)){
		if(!get_out) and (!startup){
		hit = 1;
		turret_health -= other.damage;
		}
	}
}
with(obj_ground_gun){
	if(place_meeting(x,y,obj_player_grenade)){
	if(!get_out) and (!startup){
	hit = 1;
	turret_health -= other.damage;
	}
	}
}
