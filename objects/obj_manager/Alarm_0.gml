global.clock = false;
switch(global.current_state){
	case "WAIT_TIME":
	// Starts STARTUP phase
	global.current_challenge++;
	global.current_state = "STARTUP";
	global.time = room_speed/2;
	PlataformBuild(true);
	break;
	case "STARTUP":
	// Starts CHALLENGE phase
	global.current_state = "CHALLENGE";
	checked = false;
	var challenge_time = RoundSetup(global.current_round,global.challenges);
	global.time = challenge_time;
	break;
	case "CHALLENGE":
	// Starts END phase
	with(all){
		if(variable_instance_exists(id, "get_out"))	get_out = true;
	}
	if(instance_exists(obj_plataform)) obj_plataform.closes = true;
	global.current_state = "END";
	global.time = room_speed;
	break;
	case "END":
	// Starts WAIT TIME phase
	global.current_state = "WAIT_TIME";
	if(global.current_challenge >= 3){
	global.player_hp = global.player_max_hp;
	global.current_challenge = 0;
	global.current_round++;
	// If passed 3 challenges starts SHOP phase instead
	PlataformBuild(false);
	if(global.current_round < 7){
	global.current_state = "SHOP";

	global.clock = true;
	global.challenges = [1,2,3,4,5,6];
	if(global.current_round == 6){
	global.challenges = [1,2,3];
	}
	/////// CREATE ITEMS

	var item_space = room_width/4;
	var item_x = room_width/2-(room_width/4);
	repeat(3){
		var item = instance_create_layer(item_x,room_height/2,"Manager",obj_item_shop);
		//item.y -= (item.sprite_height/2)+(sprite_get_height(spr_plataform)/2);
		var choosen_item = irandom(array_length(global.items_on_play)-1);
		item.random_item = global.items_on_play[choosen_item];
		array_delete(global.items_on_play,choosen_item,1);
		item_x += item_space;
	}
	
	///////
	
	}else{
	global.current_state = "FINAL";	
	global.challenges = [1,2,3,4,5,6];
	}
	}
	global.time = room_speed;
	break;
}
