if(instance_exists(obj_player)){
	image_xscale = obj_player.image_xscale;
	y = obj_player.y;
	x = obj_player.x+((obj_player.sprite_width/2)*-1);
	if(!obj_player.visible) instance_destroy();
}else{
instance_destroy();	
}
hit -= 0.03;
