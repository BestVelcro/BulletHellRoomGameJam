if(instance_exists(obj_player)){
	draw_sprite_ext(spr_gun_support,0,x,y,image_xscale,image_yscale,image_angle,c_white,1);
	var player_dir = point_direction(x,y,obj_player.x,obj_player.y);
	var support_extention = sprite_get_width(spr_gun_support)*gun_side;
	draw_sprite_ext(spr_gun_weapon,0,x+support_extention,y,abs(image_xscale),image_yscale,player_dir,c_white,1);
	draw_sprite(spr_gun_articulation,0,x+support_extention,y);
	/////////////////////////////
	draw_sprite_ext(spr_gun_support,1,x,y,image_xscale,image_yscale,image_angle,c_white,hit);
	var player_dir = point_direction(x,y,obj_player.x,obj_player.y);
	var support_extention = sprite_get_width(spr_gun_support)*gun_side;
	draw_sprite_ext(spr_gun_weapon,1,x+support_extention,y,abs(image_xscale),image_yscale,player_dir,c_white,hit);
	draw_sprite_ext(spr_gun_articulation,1,x+support_extention,y,image_xscale,image_yscale,image_angle,c_white,hit);
}
