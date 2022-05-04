if(!other.dead){
if(sprite_index == spr_bullet_rpg){
	if(!exploded){
	speed = 0;
	visible = false;
	if(StartExplosion(x, y, obj_player, 40, 0.3, id)){
		obj_manager.shake_magnitude += obj_manager.shake_max_magnitude/2;
		DamageTaken(bullet_damage, true, false);
	}
	exploded = true;
	}
}else{
	DamageTaken(bullet_damage, false, false);	
	instance_destroy();
}
}
