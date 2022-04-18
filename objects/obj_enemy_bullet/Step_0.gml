if(homing) and (instance_exists(obj_player)){
	var player_direction = point_direction(x,y,obj_player.x,obj_player.y);
	direction += sign(angle_difference(player_direction,direction));
	image_angle = direction;
}
