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
	["Grenade Launcher", "Kaboom!", spr_grenade, true, false, false, 15, 9],
	["Psychic", "Homing Shots", spr_homing, true, true, false, 15, 10],
	["Lucky Coins", "More Coins!", spr_lucky_coins, true, false, false, 15, 11],
	["Magnet", "Very Attractive", spr_magnet, false, true, false, 15, 12],
	["Mirror", "Backwards Shot", spr_mirror_shot, true, true, false, 15, 13],
	["Bank Loan", "Money Flies!", spr_money_flies, true, true, false, 15, 14],
	["Multibarrel", "More Bullets", spr_more_bullets, true, false, false, 15, 15],
	["Light Steps", "No more Traps!", spr_non_trap, true, false, false, 15, 16],
	["Holy Bubble", "Protection", spr_protection, true, false, false, 15, 17],
	["Corrosion", "Kill from the inside", spr_radiation, false, false, true, 15, 18],
	["Warm Heart", "Heal the Wounds", spr_regeneration, false, true, true, 15, 19]
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
			bullet_speed += floor(default_bullet_speed/2);
			spread = 3;
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
		case 10:
		with(obj_player_gun){
			bullet_speed -= floor(default_bullet_speed/2);
		}
		break;
		case 11:
		global.coin_multiplier++;
		break;
		case 13:
		with(obj_player_gun) sprite_index = spr_mirror_gun;
		break;
		case 14:
		global.coin_multiplier++;
		break;
		case 15:
		with(obj_player_gun) bullet_count++;
		break;
		case 16:
		global.traps = false;
		break;
		case 17:
		instance_create_layer(x,y,"Cenario",obj_player_orbital);
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
		var bullet = obj_player_bullet;
		with(obj_player_gun) bullet = bullet_shot;
		with(bullet){	
		var check_near = [instance_nearest(x,y,obj_enemy_gun),instance_nearest(x,y,obj_ground_gun),instance_nearest(x,y,obj_enemy_gun_roof)];
		var object_distance = room_width*99;
		var distance_check = 0;
		var nearest_object = noone;
		var i = 0;
		repeat(array_length(check_near)){
			if(check_near[i] != noone){
				distance_check = point_distance(x,y,check_near[i].x,check_near[i].y);
			}else{
				distance_check = room_width*99;
			}
			if(distance_check <= object_distance){
				nearest_object = check_near[i];	
				object_distance = distance_check;
			}
			i++;
		}
		show_debug_message(string(nearest_object));
		if(nearest_object != noone){
			
			var wall_gun_angle = point_direction(x,y,nearest_object.x,nearest_object.y);
			var homing_angle = angle_difference(wall_gun_angle,direction);
			var nearest_distance = point_distance(x,y,nearest_object.x,nearest_object.y);
			direction += sign(homing_angle)*((5/(nearest_distance/10))+1);
			image_angle = direction;
		}
		}
		
		break;
		case 12:
		var bullet_attraction = noone;
		with(obj_player_gun) bullet_attraction = bullet_shot;
		with(bullet_attraction){
			hspeed += sign(obj_player.x-x)/5;
			vspeed += sign(obj_player.y-y)/5;
			image_angle = direction;
		}
		with(obj_coin){
			hspeed += sign(obj_player.x-x)/3;
		}
		break;
		case 13:
		with(obj_player_gun){
			if(fire_buttom) and (can_fire) and (visible){
				var bullet_space = cannon_size/bullet_count;
				var bullet_start = bullet_space/2;
				var spread_angle = random_range(-spread,spread);
				var mirror = image_angle+180;
				repeat(bullet_count){
				var barrel_dirx = lengthdir_x(cannon_size/2,mirror-90);
				var barrel_diry = lengthdir_y(cannon_size/2,mirror-90);
	
				var bullet_dirx = lengthdir_x(bullet_start,mirror+90)+barrel_dirx;
				var bullet_diry = lengthdir_y(bullet_start,mirror+90)+barrel_diry;
	
				var bullet = instance_create_layer(x+bullet_dirx,y+bullet_diry,"PlayerGun",bullet_shot);
				bullet.direction = mirror+spread_angle;
				bullet.image_yscale = image_yscale;
				bullet.speed = bullet_speed;
				bullet.hspeed += obj_player.hs_speed/2;
				bullet.image_angle = bullet.direction;
				bullet.damage = base_damage+global.player_damage;
				bullet_start += bullet_space
				}
			}
		}
		break;
		case 14:
		with(obj_coin){
			vspeed -= 0.25;
		}
		break;
		case 19:
		if(iframe){
			global.regen = false;	
		}
		break;
	}
}

function OnClock(item_id, clock_time) {
		var timer = clock_time;
	switch(item_id){
		case 18:
		if(timer > room_speed){
			timer = 0;
			with(obj_enemy_gun){
			if(!get_out) and (!startup){
			hit = 1;
			turret_health -= global.player_damage+(turret_health/10)+1;
			}
			}
			with(obj_enemy_gun_roof){
			if(!get_out) and (!startup){
			hit = 1;
			turret_health -= global.player_damage+(turret_health/10)+1;
			}
			}
			with(obj_ground_gun){
			if(!get_out) and (!startup){
			hit = 1;
			turret_health -= global.player_damage+(turret_health/10)+1;
			}
			}
		}
		break;
		case 19:
			var wait_regen = room_speed/4;
			if(!global.regen) wait_regen = room_speed*3;
			if(timer > wait_regen){
			timer = 0;
			if(global.regen){
				global.player_hp = clamp(global.player_hp+floor(global.player_max_hp/40),0,global.player_max_hp);
			}else{
			global.regen = true;	
			}
			}
		break;
	}
	timer++;
	return timer;
}
