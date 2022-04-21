if(!global.clock){
	global.clock = true;
	alarm[0] = global.time;
}

fx_set_parameter(shake_fx, "g_Magnitude", shake_magnitude)
fx_set_parameter(shake_fx, "g_ShakeSpeed", shake_speed);

shake_magnitude = clamp(shake_magnitude-0.2, 0, shake_magnitude);
