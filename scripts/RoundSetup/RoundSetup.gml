global.challenges = [1,2,3,4,5,6];

global.left_slots = noone;
global.summon_left_slot = noone;

global.right_slots = noone;
global.summon_right_slot = noone;

global.laser_angles_left = noone;
global.laser_angles_right = noone;

#macro random_width (room_width/2)+random_range(-room_width/4,room_width/4)

function RoundSetup(current_round,current_challenge){
var setup_number = irandom(array_length(global.challenges)-1);
var choosen_challenge = 1//global.challenges[setup_number];
array_delete(global.challenges, setup_number,1)
switch(current_round){
	// ROUND 1 CHALLENGES
	case 1:
	switch(choosen_challenge){
		case 1:
		SetGunsSlotsLeft([spr_gun_laser, spr_gun_rpg,spr_gun_weapon,spr_gun_laser], 3, [45,315]);
		SetGunsSlotsRight([spr_gun_weapon], 1, noone);
		break;
		case 2:
		SummonGuns(2);
		SummonTrap("BLADE", 0);
		SummonTrap("LANDMINE", random_width);
		SummonTrap("SPIKE", random_width);
		SummonTrap("SNIPER", random_width);
		break;
		case 3:
		SummonGuns(4);
		SummonTrap("BLADE", 0);
		SummonTrap("SPIKE", random_width);
		break;
		case 4:
		SummonGuns(6);
		break;
		case 5:
		SummonGuns(4);
		SummonTrap("BLADE", 0);
		SummonTrap("LANDMINE", random_width);
		SummonTrap("SPIKE", random_width);
		SummonTrap("SNIPER", random_width);
		break;
		case 6:
		SummonGuns(4);
		SummonTrap("BLADE", 0);
		SummonTrap("SNIPER", random_width);
		break;
	}
	break;
	// ROUND 2 CHALLENGES
	case 2:
	switch(choosen_challenge){
		case 1:
		SummonGuns(4);
		instance_create_layer(room_width/4,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);
		break;
		case 2:
		SummonGuns(2);
		break;
		case 3:
		SummonGuns(8);
		break;
		case 4:
		SummonGuns(10);
		instance_create_layer(room_width/2+room_width/4,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);
		instance_create_layer(room_width/4,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);
		break;
		case 5:
		SummonGuns(6);
		break;
		case 6:
		SummonGuns(12);
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
return room_speed*16;
}

function SummonTrap(type_trap, x_coordinates){
	if(type_trap == "SNIPER"){
		instance_create_layer(x_coordinates,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);	
	}else{
		var layer_summon = "Guns";
		if(type_trap == "BLADE") layer_summon = "Blade";
		with(instance_create_layer(x,y,layer_summon,obj_enemy_trap)){
			x = x_coordinates;
			y = room_height-sprite_get_height(spr_wall)
			trap_type = type_trap;	
			event_user(0);
		}
	}
}
//////////////////////////


// SET GUNS THAT CAN APPEAR ON THE LEFT SIDE
function SetGunsSlotsLeft(guns_order, wall_slots, laser_angles){
	global.summon_left_slot = guns_order;
	var gun_spacement = room_height/wall_slots;
	var slot = gun_spacement/2;
	if(ds_exists(global.left_slots, ds_type_list)) ds_list_destroy(global.left_slots);
	global.left_slots = ds_list_create();
	repeat(wall_slots){
	ds_list_add(global.left_slots, slot);
	slot += gun_spacement;
	}
	if(laser_angles != noone){
		global.laser_angles_left = laser_angles;	
	}else{
		global.laser_angles_left = noone;	
	}
}

// SUMMON GUNS IN ANY AVALIABLE GUN SLOTS ON THE LEFT SIDE
function SummonGunsLeftSlot(){
	if(ds_exists(global.left_slots,ds_type_list)){
	repeat(ds_list_size(global.left_slots)){
		var gun = array_pop(global.summon_left_slot);
		///////////////////////////////
	if(gun != undefined){
		with(instance_create_layer(x,y,"Guns",obj_enemy_gun)){
			gun_side = 1;
			x = sprite_get_width(spr_wall);
			y = ds_list_find_value(global.left_slots,0);
			choosen_gun = gun;
			if(gun == spr_gun_laser) and (global.laser_angles_left != noone){
				laser_endpoint = array_pop(global.laser_angles_left);
			}
			alarm[1] = 2;
		}
	}
	ds_list_delete(global.left_slots,0);
	}
	///////////////////////////////
	}
}

//////////////////////////

// SET GUNS THAT CAN APPEAR ON THE RIGHT SIDE
function SetGunsSlotsRight(guns_order, wall_slots, laser_angles){
	global.summon_right_slot = guns_order;
	var gun_spacement = room_height/wall_slots;
	var slot = gun_spacement/2;
	if(ds_exists(global.right_slots, ds_type_list)) ds_list_destroy(global.right_slots);
	global.right_slots = ds_list_create();
	repeat(wall_slots){
	ds_list_add(global.right_slots, slot);
	slot += gun_spacement;
	}
	if(laser_angles != noone){
		global.laser_angles_right = laser_angles;	
	}else{
		global.laser_angles_right = noone;	
	}
}

// SUMMON GUNS IN ANY AVALIABLE GUN SLOTS ON THE RIGHT SIDE
function SummonGunsRightSlot(){
	if(ds_exists(global.right_slots,ds_type_list)){
	repeat(ds_list_size(global.right_slots)){
		var gun = array_pop(global.summon_right_slot);
		///////////////////////////////
	if(gun != undefined){
		with(instance_create_layer(x,y,"Guns",obj_enemy_gun)){
			gun_side = -1;
			cannon_angle = 180;
			image_xscale = -1;
			x = room_width-sprite_get_width(spr_wall);
			y = ds_list_find_value(global.right_slots,0);
			choosen_gun = gun;
			if(gun == spr_gun_laser) and (global.laser_angles_right != noone){
				laser_endpoint = array_pop(global.laser_angles_right);
			}
			alarm[1] = 2;
		}
	}
	ds_list_delete(global.right_slots,0);
	}
	///////////////////////////////
	}
}

//////////////////////////
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
	choosen_gun = choose(spr_gun_laser,spr_gun_rpg,spr_gun_weapon,spr_gun_minigun);
	laser_endpoint = choose(45,315,0,70,20);
	alarm[1] = 2;
	}
}
}
