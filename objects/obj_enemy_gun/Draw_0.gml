if(instance_exists(obj_player)){
	var player_dir = aim_current_direction;
	var cannon_x = lengthdir_x(sprite_get_width(spr_gun_support)/2,player_dir);
	var cannon_y = lengthdir_y(sprite_get_width(spr_gun_support)/2,player_dir);
	/////////////////////////////
	// Laser
	if(laser_gun) draw_sprite_ext(spr_bullet_laser,0,x+cannon_x+(x_startup_offset_cannon*(image_xscale*-1)),y+cannon_y,length_laser/laser_startup,image_yscale,aim_current_direction,c_white,1);
	if(laser){
		draw_set_color(c_red);
		var laser_offset_x = laser_x-laseroffset_x;
		var laser_offset_y = laser_y-(laseroffset_y*image_yscale)-1;
		var laser_direction = point_direction(0,0,laser_offset_x,laser_offset_y);
		var laser_distance = point_distance(0,0,laser_x,laser_y);
		var laser_dirx = lengthdir_x(laser_distance,aim_current_direction+laser_direction);
		var laser_diry = lengthdir_y(laser_distance,aim_current_direction+laser_direction);
		
		var endlaser_x = lengthdir_x(40,aim_current_direction);
		var endlaser_y = lengthdir_y(40,aim_current_direction);
		draw_line_width(x+cannon_x+(x_startup_offset_cannon*(image_xscale*-1))+laser_dirx,y+cannon_y+laser_diry,x+cannon_x+(x_startup_offset_cannon*(image_xscale*-1))+laser_dirx+endlaser_x,y+cannon_y+laser_diry+endlaser_y,1);
		draw_set_color(c_white);
	}
	////////////
	draw_sprite_ext(random_gun,image_index,x+cannon_x+(x_startup_offset_cannon*(image_xscale*-1)),y+cannon_y,abs(image_xscale),image_yscale,player_dir,c_white,1);
	draw_sprite_ext(spr_gun_support,0,x+(x_startup_offset_support*(image_xscale*-1)),y,image_xscale,image_yscale,0,c_white,1);
	/////////////////////////////
	draw_sprite_ext(spr_gun_support,1,x+(x_startup_offset_support*(image_xscale*-1)),y,image_xscale,image_yscale,0,c_white,hit);

	//draw_text(x+(30*image_xscale),y,string(length_laser));
}
