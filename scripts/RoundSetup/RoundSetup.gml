global.challenges = [1,2,3,4,5,6];

global.left_slots = noone;
global.summon_left_slot = noone;

global.right_slots = noone;
global.summon_right_slot = noone;

global.laser_angles_left = noone;
global.laser_angles_right = noone;

///// OPTIONS
/*

		SetGunsSlotsLeft([Guns on Left Array], Guns Slots, Lasers Angle);
		SetGunsSlotsRight([spr_gun_weapon, spr_gun_rpg, spr_gun_weapon], 2, noone);
		SummonTrap("BLADE", 0);
		SummonTrap("LANDMINE", x_coordinate);
		SummonTrap("SPIKE", random_width);
		SummonTrap("SNIPER", random_width);
		SummonTrap("SNIPER", random_width);
		SummonTrap("TOP_GUN", room_width/2, 3, spr_gun_weapon);
*/
/////
#macro blade_summon SummonTrap("BLADE", 0, 0, spr_nothing);
#macro random_width (room_width/2)+random_range(-room_width/4,room_width/4)

function RoundSetup(current_round,current_challenge){

var setup_number = irandom(array_length(global.challenges)-1);
var choosen_challenge = global.challenges[setup_number];
array_delete(global.challenges, setup_number,1)
show_debug_message(string(choosen_challenge));
switch(current_round){
	// ROUND 1 CHALLENGES
	case 1:
	switch(choosen_challenge){
		case 1:
		SetGunsSlotsLeft([spr_gun_weapon, spr_nothing, spr_nothing], 3, noone);
		SetGunsSlotsRight([spr_gun_weapon,spr_gun_laser,spr_nothing], 3, [0]);
		break;
		case 2:
		SetGunsSlotsLeft([spr_gun_weapon,spr_nothing,spr_gun_weapon], 3, noone);
		SetGunsSlotsRight([spr_nothing,spr_gun_weapon,spr_nothing], 3, noone);
		break;
		case 3:
		SetGunsSlotsLeft([spr_gun_weapon], 3, noone);
		SetGunsSlotsRight([spr_gun_weapon], 3, noone);
		blade_summon
		blade_summon
		break;
		case 4:
		SetGunsSlotsLeft([spr_nothing,spr_nothing,spr_gun_weapon], 3, [45]);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_nothing], 3, [315]);
		blade_summon
		return room_speed*24;
		break;
		case 5:
		SetGunsSlotsLeft([spr_gun_laser, spr_nothing, spr_gun_weapon,spr_nothing], 4, [0]);
		SetGunsSlotsRight([spr_nothing, spr_nothing, spr_gun_weapon, spr_nothing], 4, noone);
		return room_speed*10;
		break;
		case 6:
		SetGunsSlotsLeft([spr_gun_laser, spr_nothing,spr_gun_laser], 3, [60,0]);
		SetGunsSlotsRight([spr_gun_laser, spr_nothing, spr_gun_laser], 3, [0,300]);
		return room_speed*3;
		break;
	}
	break;
	// ROUND 2 CHALLENGES
	case 2:
	switch(choosen_challenge){
		case 1:
		SetGunsSlotsLeft([spr_nothing,spr_gun_laser,spr_gun_weapon], 3, [45]);
		SetGunsSlotsRight([spr_gun_weapon, spr_gun_laser, spr_nothing], 3, [315]);
		blade_summon
		return room_speed*24;
		break;
		case 2:
		SetGunsSlotsLeft([spr_gun_laser, spr_nothing, spr_nothing, spr_gun_laser], 4, [60, 300]);
		SetGunsSlotsRight([spr_gun_laser, spr_nothing, spr_nothing, spr_gun_laser], 4, [60, 300]);
		SummonTrap("SNIPER", room_width-(room_width/8));
		SummonTrap("SNIPER", room_width/8);
		break;
		case 3:
		SummonTrap("SNIPER", room_width/2);
		SummonTrap("TOP_GUN", sprite_get_width(spr_wall)+sprite_get_height(spr_gun_support), 4, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width-sprite_get_width(spr_wall)-sprite_get_height(spr_gun_support), 4, spr_gun_weapon);
		break;
		case 4:
		SetGunsSlotsLeft([spr_nothing, spr_nothing, spr_gun_weapon, spr_gun_weapon], 4, noone);
		SetGunsSlotsRight([spr_nothing, spr_nothing, spr_gun_weapon, spr_nothing], 4, noone);
		SummonTrap("TOP_GUN", room_width/2, 2, spr_gun_weapon);
		break;
		case 5:
		SetGunsSlotsLeft([spr_gun_weapon, spr_nothing, spr_nothing, spr_gun_laser, spr_gun_weapon], 4, [315]);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_nothing, spr_gun_laser, spr_gun_weapon], 4, [315]);
		break;
		case 6:
		SetGunsSlotsLeft([spr_nothing, spr_gun_weapon, spr_nothing, spr_gun_laser], 4, [0]);
		SetGunsSlotsRight([spr_gun_laser, spr_nothing, spr_gun_weapon, spr_nothing], 4, [0]);
		break;
	}
	break;
	// ROUND 3 CHALLENGES
	case 3:
	switch(choosen_challenge){
		case 1:
		SetGunsSlotsLeft([spr_gun_weapon, spr_gun_rpg, spr_nothing, spr_gun_laser], 3, [340]);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_gun_weapon, spr_nothing, spr_gun_weapon], 3, noone);
		SummonTrap("LANDMINE", room_width-(room_width/8));
		SummonTrap("LANDMINE", room_width-((room_width/8)*2));
		break;
		case 2:
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_rpg, spr_nothing, spr_gun_laser], 4, [300]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_rpg, spr_nothing, spr_gun_laser], 4, [300]);
		return room_speed*20;
		break;
		case 3:
		SetGunsSlotsLeft([spr_gun_weapon, spr_gun_weapon, spr_nothing, spr_gun_rpg], 3, noone);
		SetGunsSlotsRight([spr_gun_weapon, spr_gun_weapon, spr_gun_laser, spr_gun_rpg], 3, [0]);
		break;
		case 4:
		SetGunsSlotsLeft([spr_gun_weapon, spr_nothing, spr_nothing, spr_gun_rpg], 3, noone);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_nothing, spr_gun_rpg], 3, noone);
		SummonTrap("SNIPER", room_width-(room_width/8));
		SummonTrap("SNIPER", room_width/8);
		break;
		case 5:
		SetGunsSlotsLeft([spr_gun_rpg, spr_nothing, spr_nothing, spr_gun_weapon], 3, noone);
		SetGunsSlotsRight([spr_gun_rpg, spr_nothing, spr_nothing, spr_gun_weapon], 3, noone);
		var space = room_width/8
		var i = 1;
		repeat(3){
		SummonTrap("LANDMINE", space*i);
		SummonTrap("LANDMINE", room_width-(space*i));
		i++
		}
		SummonTrap("LANDMINE", room_width/2);
		break;
		case 6:
		SetGunsSlotsLeft([spr_gun_weapon, spr_nothing, spr_gun_rpg, spr_nothing, spr_gun_laser], 4, [0]);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_gun_rpg, spr_gun_laser, spr_nothing], 4, [0]);
		var space = room_width/8
		var i = 0;
		repeat(3){
		SummonTrap("LANDMINE", (room_width/2-(room_width/8))+space*i);
		i++
		}
		break;
	}
	break;
	// ROUND 4 CHALLENGES
	case 4:
	switch(choosen_challenge){
		case 1:
		SetGunsSlotsLeft([spr_gun_weapon, spr_nothing, spr_gun_laser, spr_nothing, spr_nothing], 4, [0]);
		SetGunsSlotsRight([spr_gun_weapon, spr_nothing, spr_gun_laser, spr_nothing, spr_nothing], 4, [0]);
		SummonTrap("TOP_GUN", room_width/4, 3, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width-(room_width/4), 3, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width/2, 4, spr_gun_weapon);
		return room_speed*20;
		break;
		case 2:
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_minigun, spr_nothing, spr_nothing, spr_gun_minigun], 3, noone);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_minigun, spr_gun_minigun, spr_nothing, spr_nothing], 3, noone);
		break;
		case 3:
		var space = room_width/12
		var i = 1;
		repeat(2){
		SummonTrap("LANDMINE", space*i);
		SummonTrap("LANDMINE", room_width-(space*i));
		i++
		}
		SummonTrap("TOP_GUN", room_width/2, 2, spr_gun_rpg);
		SummonTrap("TOP_GUN", room_width/4, 1, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width-(room_width/4), 1, spr_gun_weapon);
		SetGunsSlotsLeft([spr_gun_minigun, spr_gun_rpg, spr_nothing, spr_nothing, spr_nothing, spr_nothing], 3, noone);
		SetGunsSlotsRight([spr_gun_minigun, spr_gun_weapon, spr_gun_rpg, spr_gun_weapon, spr_nothing, spr_nothing], 3, noone);
		break;
		case 4:
		SetGunsSlotsLeft([spr_gun_minigun, spr_gun_rpg, spr_gun_rpg, spr_nothing, spr_nothing, spr_gun_rpg], 4, noone);
		SetGunsSlotsRight([spr_gun_minigun, spr_gun_weapon, spr_gun_rpg, spr_nothing, spr_nothing, spr_gun_rpg], 4, noone);
		break;
		case 5:
		SummonTrap("TOP_GUN", room_width/2, 1, spr_gun_weapon);
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_weapon, spr_gun_laser, spr_gun_weapon, spr_nothing, spr_nothing, spr_nothing], 5, [0]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_weapon, spr_nothing, spr_gun_weapon, spr_nothing, spr_nothing, spr_gun_laser], 5, [0]);
		break;
		case 6:
		SummonTrap("SPIKE", room_width/2);
		var space = room_width/16
		var i = 1;
		repeat(3){
		SummonTrap("SPIKE", space*i);
		SummonTrap("SPIKE", room_width-(space*i));
		i++
		}
		SetGunsSlotsLeft([spr_gun_laser, spr_gun_rpg, spr_nothing, spr_nothing], 4, [40]);
		SetGunsSlotsRight([spr_gun_laser, spr_gun_rpg, spr_gun_laser, spr_nothing], 4, [40, 0]);
		return room_speed*12;
		break;
	}
	break;
	// ROUND 5 CHALLENGES
	case 5:
	switch(choosen_challenge){
		case 1:
		with(obj_plataform) closes = true;
		PlataformBuild(false)
		repeat(18){
		blade_summon	
		}
		var space = room_width/16
		var i = 1;
		repeat(8){
		SummonTrap("SPIKE", space*i);
		SummonTrap("SPIKE", room_width-(space*i));
		i++
		}
		SummonTrap("TOP_GUN", room_width/4, 1, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width-(room_width/4), 1, spr_gun_weapon);
		return room_speed*8;
		break;
		case 2:
		SummonTrap("TOP_GUN", room_width/2, 4, spr_gun_rpg);
		var space = room_width/8
		var i = 0;
		repeat(3){
		SummonTrap("LANDMINE", (room_width/2-(room_width/8))+space*i);
		i++
		}
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_weapon, spr_nothing, spr_nothing, spr_nothing], 4, noone);
		SetGunsSlotsRight([spr_nothing, spr_nothing, spr_nothing, spr_nothing], 4, noone);
		SummonTrap("SNIPER", room_width-(room_width/8), 4, spr_gun_rpg);
		break;
		case 3:
		SetGunsSlotsLeft([spr_nothing, spr_gun_minigun, spr_nothing, spr_gun_laser], 3, [0]);
		SetGunsSlotsRight([spr_gun_minigun, spr_gun_rpg, spr_gun_rpg, spr_gun_weapon, spr_gun_laser, spr_nothing], 4, noone)
		return room_speed*24;
		break;
		case 4:
		var space = room_width/16
		var i = 1;
		repeat(8){
		SummonTrap("TOP_GUN", space*i, 1, spr_gun_weapon);
		SummonTrap("TOP_GUN", room_width-(space*i), 1, spr_gun_weapon);
		i++
		}
		SummonTrap("TOP_GUN", room_width/2, 4, spr_gun_weapon);
		SetGunsSlotsLeft([spr_nothing, spr_nothing, spr_nothing, spr_gun_weapon], 4, noone);
		SetGunsSlotsRight([spr_nothing, spr_nothing, spr_nothing, spr_gun_weapon], 4, noone);
		break;
		case 5:
		SummonTrap("TOP_GUN", room_width/2, 2, spr_gun_weapon);
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_rpg, spr_gun_rpg, spr_gun_weapon,spr_gun_weapon,spr_gun_weapon,spr_gun_weapon], 4, noone);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_rpg, spr_gun_rpg, spr_gun_weapon,spr_gun_weapon,spr_gun_weapon,spr_gun_weapon], 4, noone);
		break;
		case 6:
		with(obj_plataform) closes = true;
		PlataformBuild(false)
		var space = room_width/4
		SummonTrap("SNIPER", space);
		SummonTrap("SNIPER", room_width-(space));
		var space = room_width/12
		var i = 1;
		repeat(5){
		SummonTrap("LANDMINE", space*i);
		SummonTrap("LANDMINE", room_width-(space*i));
		i++
		}
		SummonTrap("SPIKE", room_width/2);
		SetGunsSlotsLeft([spr_nothing, spr_gun_weapon, spr_nothing, spr_nothing], 4, noone);
		SetGunsSlotsRight([spr_nothing, spr_gun_weapon, spr_nothing, spr_nothing], 4, noone);
		return room_speed*12;
		break;
	}
	break;
	// ROUND 6 CHALLENGES
	case 6:
	switch(choosen_challenge){
		case 1:
		with(obj_plataform) closes = true;
		PlataformBuild(false)
		var space = room_width/16
		var i = 1;
		repeat(8){
		SummonTrap("SPIKE", space*i);
		SummonTrap("SPIKE", room_width-(space*i));
		i++
		}
		SummonTrap("TOP_GUN", room_width/2, 4, spr_gun_rpg);
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_laser, spr_nothing], 4, [0]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_nothing, spr_nothing], 4, noone);
		break;
		case 2:
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_minigun, spr_gun_weapon, spr_gun_weapon, spr_gun_laser], 4, [290]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_minigun, spr_gun_weapon, spr_gun_weapon, spr_gun_laser], 4, [290]);
		break;
		case 3:
		SetGunsSlotsLeft([spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser], 5, [40, 30, 20, 10, 350]);
		SetGunsSlotsRight([spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser], 5, [10, 350, 340, 330, 320]);
		return room_speed*3;
		break;
		case 4:
		SetGunsSlotsLeft([spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser], 5, [40, 30, 20, 10, 350]);
		SetGunsSlotsRight([spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser, spr_gun_laser], 5, [10, 350, 340, 330, 320]);
		return room_speed*3;
		break;
		case 5:
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_minigun, spr_gun_weapon, spr_gun_weapon, spr_gun_laser], 4, [290]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_minigun, spr_gun_weapon, spr_gun_weapon, spr_gun_laser], 4, [290]);
		break;
		case 6:
		with(obj_plataform) closes = true;
		PlataformBuild(false)
		var space = room_width/16
		var i = 1;
		repeat(8){
		SummonTrap("SPIKE", space*i);
		SummonTrap("SPIKE", room_width-(space*i));
		i++
		}
		SummonTrap("TOP_GUN", room_width/2, 4, spr_gun_rpg);
		SetGunsSlotsLeft([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_gun_laser, spr_nothing], 4, [0]);
		SetGunsSlotsRight([spr_gun_rpg, spr_gun_weapon, spr_gun_weapon, spr_nothing, spr_nothing], 4, noone);
		break;
	}
	break;
}
return room_speed*16;
}

function SummonTrap(type_trap, x_coordinates, cannons, top_gun_sprite){
	var summon_id = noone;
	if(type_trap == "TOP_GUN"){
		var gun = instance_create_layer(x_coordinates,sprite_get_height(spr_wall),"Guns",obj_enemy_gun_roof);
		gun.number_of_bullets = cannons;
		gun.angle_offset = 180/gun.number_of_bullets;
		gun.starting_gun = gun.angle_offset/2;
		gun.choosen_gun = top_gun_sprite
		gun.x = x_coordinates;
		summon_id = gun.id
		with(gun){
			event_user(0)
		}
	}else if(type_trap == "SNIPER"){
		var sniper = instance_create_layer(x_coordinates,room_height-(sprite_get_height(spr_wall)),"Guns",obj_ground_gun);	
		summon_id = sniper.id;
	}else{
		var layer_summon = "Guns";
		if(type_trap == "BLADE") layer_summon = "Blade";
		with(instance_create_layer(x,y,layer_summon,obj_enemy_trap)){
			x = x_coordinates;
			y = room_height-sprite_get_height(spr_wall)
			trap_type = type_trap;	
			event_user(0);
			summon_id = id;
		}
	}
	return summon_id;
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
