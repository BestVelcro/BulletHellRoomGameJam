if(instance_exists(obj_player)){
	var player_dir = aim_current_direction;
	cannon_x = lengthdir_x(sprite_get_width(spr_gun_support)/2,player_dir);
	cannon_y = lengthdir_y(sprite_get_width(spr_gun_support)/2,player_dir);
	
	var bullet_angle = starting_gun;
	repeat(number_of_bullets){
	draw_sprite_ext(choosen_gun,image_index,x+cannon_x,y+cannon_y-(y_startup_offset_cannon),abs(image_xscale),image_yscale,player_dir+(90-bullet_angle),c_white,1);
	bullet_angle += angle_offset;
	}
	draw_sprite_ext(spr_gun_support,0,x,y-(y_startup_offset_support),image_xscale,image_yscale,image_angle,c_white,1);
	
	///////////////////////////// hit flash
	draw_sprite_ext(spr_gun_support,1,x,y-(y_startup_offset_support),image_xscale,image_yscale,image_angle,c_white,hit);

}
