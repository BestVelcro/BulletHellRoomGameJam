	global.items_array = [
	// ["Item_Name", "Description", spr_id, Boolean (Script on Pickup), Boolean (Script on Step Event), Boolean (Clock Event), Price
	// 7 Values + index position
	["The Big Knight", "More Armor", spr_big_knight, true, false, false, 50, 0],
	["Boots", "Go quickly", spr_boots, true, false, false , 30, 1],
	["Broken Shield", "Damage and Armor", spr_broken_shield, true, false, false, 15, 2],
	["Bullet Rain", "More fire Rate", spr_bullet_rain, true, false, false, 15, 3],
	["Infibeam", "Constant Spinning Beam", spr_continuous_beam, true, false, false, 15, 4],
	["Fuzil", "High Fire Rate High Speed", spr_damage_speed, true, false, false, 15, 5],
	["Dash", "Double tap to Dash", spr_dash, false, true, false, 15, 6],
	["Big Heart", "Double Health", spr_double_health, true, false, false, 15, 7],
	["Sky Highs", "Double Jump", spr_double_jump, false, true, false, 15, 8],
	["Grenade Launcher", "Kaboom!", spr_grenade, true, false, false, 15, 9]
	//["Psychic", "Homing Shots", spr_homing, false, true, false, 15, 10]
	]
	

	
function OnPickup(item_id) {
	switch(item_id){
		case 0:
		global.player_armor -= global.player_armor/2;
		break;
		case 1:
		hs_max_speed += floor(hs_max_speed/2);
		break;
		case 2:
		if(instance_exists(obj_player_gun)){
		global.player_damage += floor(obj_player_gun.base_damage/2);
		}else{
		global.player_damage += 5;	
		}
		global.player_armor -= global.player_armor/4;
		break;
		case 3:
		with(obj_player_gun) fire_rate -= floor(default_fire_rate/2);
		break;
		case 4:
		instance_create_layer(x,y,"Guns",obj_player_beam)
		break;
		case 5:
		with(obj_player_gun){
			fire_rate -= floor(default_fire_rate/4);
			bullet_speed -= floor(default_bullet_speed/4);
		}
		break;
		case 7:
		global.player_max_hp += global.player_max_hp;
		global.player_hp = global.player_max_hp;
		break;
		case 9:
		with(obj_player_gun){
			var new_default_fire_rate = room_speed*1.5;
			var new_default_bullet_speed = 6;
			sprite_index = spr_player_gun_grenade_launcher;
			bullet_shot = obj_player_grenade;
			
			fire_rate = new_default_fire_rate/(default_fire_rate/fire_rate);
			default_fire_rate = new_default_fire_rate;
			
			bullet_speed = new_default_bullet_speed/(default_bullet_speed/bullet_speed);
			default_bullet_speed = new_default_bullet_speed;
			
			base_damage = 40;
			
			global.player_damage += 5;
		}
		break;
	}
}

function OnStep(item_id) {
	switch(item_id){
		case 6:
		var press_horizontal = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
		if(can_dash) and (press_horizontal != 0){
			if(dash_buttom > 0) and (last_pressed == press_horizontal){
			can_dash = false;	
			hs_speed += image_xscale*(hs_max_speed*10);
			dash_buttom = room_speed;
			on_dash = true;
			dash_x = x;
			dash_y = y;
			}
			if(can_dash) dash_buttom = room_speed/4;
			last_pressed = press_horizontal;
		}
		
		if(on_dash){
			var test = instance_create_layer(x,y,"TopParticles",obj_particle);
			test.sprite_index = sprite_index;
			test.image_xscale = image_xscale;
			test.image_speed = 0;
			test.image_index = image_index;
			test.particle_owner = id;
			test.particle_type = "dash_particle";
		}
		
		if(on_dash) and (abs(hs_speed) <= hs_max_speed+1) on_dash = false;
		
		if(!can_dash) and (dash_buttom <= 0){
			can_dash = true;
			repeat(20){
			var particle = instance_create_layer(x,y,"BottomParticles",obj_particle);
			particle.sprite_index = spr_bullet_laser_particle;
			particle.direction = irandom(360);
			particle.speed = 2;
			particle.particle_owner = id;
			particle.image_color = c_blue;
			particle.particle_type = "dash_on_particle";
			}
		}
		with(obj_particle){
			if(particle_owner == other.id){
				switch(particle_type){
				case "dash_on_particle":
				speed -= 0.05;
				image_alpha -= 0.02;
				break;
				case "dash_particle":
				image_alpha -= 0.05;
				break;
				}
				if(image_alpha <= 0) instance_destroy();	
			}
		}
		dash_buttom = clamp(dash_buttom-1,0,room_speed*4);
		break;
		case 8:
			if(vs_speed != 0) and (jump) and (double_jump){
				vs_speed = -jump_power;
				double_jump = false;
			}
			if(on_floor){
				double_jump = true;	
			}
		break;
		case 10:
		
		break;
	}
}

function OnClock(item_id, clock_time) {
		var timer = clock_time;
	switch(item_id){
		case 2:
		if(timer > room_speed*2){
			timer = 0;
			var angle = 0;
			var bullet_amount = 180;
			repeat(bullet_amount){
				var bullet = instance_create_layer(x,y,"Guns",obj_player_bullet);
				bullet.image_angle = angle;
				bullet.direction = angle;
				bullet.speed = 2;
				bullet.damage = 20;
				angle += 360/bullet_amount;
			}
		}
		break;
	}
	timer++;
	return timer;
}
