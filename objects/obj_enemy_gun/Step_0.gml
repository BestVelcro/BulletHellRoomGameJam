hit = lerp(0,hit,0.2);

if(instance_exists(obj_player)) aim_target = point_direction(x,y,obj_player.x,obj_player.y); else aim_target = cannon_angle;
aim_current_direction += sign(angle_difference(aim_target,aim_current_direction));

if(startup){
x_startup_offset_support = lerp(0,x_startup_offset_support,0.9);
x_startup_offset_cannon = lerp(0,x_startup_offset_cannon,0.9);
aim_current_direction = cannon_angle;
if(x_startup_offset_cannon <= 1) and (x_startup_offset_support <= 1){
	startup = false;
}
}

