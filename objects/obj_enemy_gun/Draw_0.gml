if(instance_exists(obj_player)){
	var player_dir = aim_current_direction;
	var cannon_x = lengthdir_x(sprite_get_width(spr_gun_support)/2,player_dir);
	var cannon_y = lengthdir_y(sprite_get_width(spr_gun_support)/2,player_dir);
	draw_sprite_ext(random_gun,image_index,x+cannon_x+(x_startup_offset_cannon*(image_xscale*-1)),y+cannon_y,abs(image_xscale),image_yscale,player_dir,c_white,1);
	draw_sprite_ext(spr_gun_support,0,x+(x_startup_offset_support*(image_xscale*-1)),y,image_xscale,image_yscale,0,c_white,1);
	/////////////////////////////
	draw_sprite_ext(spr_gun_support,1,x,y,image_xscale,image_yscale,0,c_white,hit);
}
