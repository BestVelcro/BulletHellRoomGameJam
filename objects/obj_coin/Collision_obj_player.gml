if(visible){
global.coins += 10;
visible = false;
repeat(5){
	var particle = instance_create_layer(x,y,"BottomParticles",obj_particle);
	particle.sprite_index = spr_bullet_laser_particle;
	particle.direction = irandom(360);
	particle.speed = 2;
	particle.particle_owner = id;
	particle.image_color = c_yellow;
	particle.particle_type = "dash_on_particle";
}
}
