draw_self();

if(instance_exists(obj_player)){
	draw_sprite_ext(spr_player_arm,0,obj_player.x,obj_player.y,image_yscale,1,0,c_white,obj_player.visible);
	draw_sprite_ext(spr_player_arm,1,obj_player.x,obj_player.y,image_yscale,1,0,c_white,obj_player.hit_flash);
}
