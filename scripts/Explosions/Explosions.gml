// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StartExplosion(explosion_x, explosion_y, object_to_check, range_check, particles_size, obj_particle_owner){
	repeat(30){
		explosion_offset_x = random_range(-sprite_width,sprite_width);
		explosion_offset_y = random_range(-sprite_width,sprite_width);
		var particle = instance_create_layer(explosion_x+explosion_offset_x,explosion_y+explosion_offset_y,choose("BottomParticles","TopParticles"),obj_particle);
		particle.direction = irandom(360);
		particle.speed = 5;
		particle.sprite_index = spr_landmine_hitbox;
		var size = random_range(particles_size-0.1, particles_size);
		particle.image_xscale = size;
		particle.image_yscale = size;
		particle.particle_owner = obj_particle_owner;
		particle.green = 255;
		particle.blue = 255;
	}
	with(object_to_check){
		if(collision_circle(explosion_x, explosion_y, range_check, id, true, false)) return true;
	}
	return false;
}

function ExplosionParticles(owner_particle){
	var particle_count = 0;
	with(obj_particle){
		if(particle_owner == owner_particle){
			particle_count++;
			
			x += random_range(-1,1);
			y += random_range(-1,1);
	
			speed = lerp(0,speed, 0.9)
			image_alpha -= random(1)/20;
			image_color = make_color_rgb(255,green,blue);
			if(blue > 0) blue = clamp(blue - random(30), 0, 255);else green = clamp(green - 10, 0, 255);
			if(image_alpha <= 0) instance_destroy();
		}
	}
	if(particle_count == 0) return false; else return true;
}
