global.clock = false;
switch(global.current_state){
	case "WAIT_TIME":
	// Starts STARTUP phase
	global.current_challenge++;
	global.current_state = "STARTUP";
	global.time = room_speed;
	PlataformBuild();
	RoundSetup(global.current_round,global.challenges);
	break;
	case "STARTUP":
	// Starts CHALLENGE phase
	global.current_state = "CHALLENGE";
	global.time = room_speed*8;
	break;
	case "CHALLENGE":
	// Starts END phase
	with(all){
		if(variable_instance_exists(id, "get_out"))	get_out = true;
	}
	if(instance_exists(obj_plataform)) instance_destroy(obj_plataform);
	global.current_state = "END";
	global.time = room_speed;
	break;
	case "END":
	// Starts WAIT TIME phase
	global.current_state = "WAIT_TIME";
	if(global.current_challenge >= 3){
	global.current_challenge = 0;
	global.current_round++;
	// If passed 3 challenges starts SHOP phase instead
	global.current_state = "SHOP";
	global.clock = true;
	global.challenges = [1,2,3,4,5,6];
	}
	global.time = room_speed*2;
	break;
}
