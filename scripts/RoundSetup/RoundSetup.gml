global.challenges = [1,2,3,4,5,6];

function RoundSetup(current_round,current_challenge){
var setup_number = irandom(array_length(global.challenges)-1);
var choosen_challenge = global.challenges[setup_number];
array_delete(global.challenges, setup_number,1)
switch(current_round){
	// ROUND 1 CHALLENGES
	case 1:
	switch(choosen_challenge){
		case 1:
		SummonGuns(4);
		break;
		case 2:
		SummonGuns(2);
		instance_create_layer(room_width/4,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);
		break;
		case 3:
		SummonGuns(8);
		break;
		case 4:
		SummonGuns(6);
		break;
		case 5:
		SummonGuns(10);
		break;
		case 6:
		SummonGuns(12);
		break;
	}
	break;
	// ROUND 2 CHALLENGES
	case 2:
	switch(choosen_challenge){
		case 1:
		SummonGuns(14);
		break;
		case 2:
		SummonGuns(16);
		break;
		case 3:
		SummonGuns(18);
		break;
		case 4:
		SummonGuns(20);
		break;
		case 5:
		SummonGuns(22);
		break;
		case 6:
		SummonGuns(24);
		break;
	}
	break;
	// ROUND 3 CHALLENGES
	case 3:
	switch(choosen_challenge){
		case 1:
		SummonGuns(26);
		break;
		case 2:
		SummonGuns(14);
		break;
		case 3:
		SummonGuns(4);
		break;
		case 4:
		SummonGuns(8);
		break;
		case 5:
		SummonGuns(6);
		break;
		case 6:
		SummonGuns(10);
		break;
	}
	break;
	// ROUND 4 CHALLENGES
	case 4:
	switch(choosen_challenge){
		case 1:
		SummonGuns(28);
		break;
		case 2:
		SummonGuns(24);
		break;
		case 3:
		SummonGuns(20);
		break;
		case 4:
		SummonGuns(22);
		break;
		case 5:
		SummonGuns(20);
		break;
		case 6:
		SummonGuns(16);
		break;
	}
	break;
	// ROUND 5 CHALLENGES
	case 5:
	switch(choosen_challenge){
		case 1:
		SummonGuns(6);
		break;
		case 2:
		SummonGuns(6);
		break;
		case 3:
		SummonGuns(6);
		break;
		case 4:
		SummonGuns(6);
		break;
		case 5:
		SummonGuns(6);
		break;
		case 6:
		SummonGuns(6);
		break;
	}
	break;
	// ROUND 6 CHALLENGES
	case 6:
	switch(choosen_challenge){
		case 1:
		SummonGuns(13);
		break;
		case 2:
		SummonGuns(13);
		break;
		case 3:
		SummonGuns(13);
		break;
		case 4:
		SummonGuns(13);
		break;
		case 5:
		SummonGuns(13);
		break;
		case 6:
		SummonGuns(13);
		break;
	}
	break;
}
}

function SummonGuns(gun_quantity){
var number_of_guns = gun_quantity;
if(number_of_guns/2 != floor(number_of_guns/2)) number_of_guns++; 
global.gun_number_size = number_of_guns;
global.gun_number_current_size = global.gun_number_size;
	
var number_of_guns_on_wall = global.gun_number_size/2;
var distance_between_guns = room_height/number_of_guns_on_wall;
repeat(global.gun_number_size){
	with(instance_create_layer(x,y,"Guns",obj_enemy_gun)){
	if(global.gun_number_current_size > 0){
		if(global.gun_number_size/2 < global.gun_number_current_size){
			gun_side = 1;
			x = sprite_get_width(spr_wall);
			show_debug_message(string(x));
			var current_guns = global.gun_number_current_size-(global.gun_number_size/2)
			y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-current_guns));
			global.gun_number_current_size--;
		}else{
			gun_side = -1;
			cannon_angle = 180;
			image_xscale = -1;
			x = room_width-sprite_get_width(spr_wall);
			y = (distance_between_guns/2)+(distance_between_guns * ((global.gun_number_size/2)-global.gun_number_current_size));
			global.gun_number_current_size--;
		}
	}	
	}
}
}
