if(homing) and (instance_exists(obj_player)){
	var player_direction = point_direction(x,y,obj_player.x,obj_player.y);
	direction += sign(angle_difference(player_direction,direction));
	image_angle = direction;
}

if(sprite_index == spr_bullet_rpg){
if(!ExplosionParticles(id)) and (exploded){
	instance_destroy();
}
}
