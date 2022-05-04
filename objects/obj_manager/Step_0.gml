if(!global.clock){
	global.clock = true;
	alarm[0] = global.time;
}

fx_set_parameter(shake_fx, "g_Magnitude", shake_magnitude)
fx_set_parameter(shake_fx, "g_ShakeSpeed", shake_speed);

shake_magnitude = clamp(shake_magnitude-0.2, 0, shake_magnitude);


if(global.current_state == "CHALLENGE"){
	SummonGunsLeftSlot();
	SummonGunsRightSlot();
	if(global.time/2 > alarm_get(0)){
		var count = 0;
		with(obj_enemy_gun){
		if(choosen_gun != spr_nothing) and (choosen_gun != spr_gun_laser) count++;	
		if(choosen_gun == spr_gun_laser) and (laser_startup == 0) count++;
		}
		count += instance_number(obj_ground_gun);
		count += instance_number(obj_enemy_gun_roof);
		if(count <= 0) and (!checked){
			alarm[0] = room_speed/2;
			checked = true;
		}
	}
}
