horizontal_speed = keyboard_check(vk_right)-keyboard_check(vk_left);
jump = keyboard_check_pressed(vk_space);
var key_down = keyboard_check(vk_down);
var lock = keyboard_check(ord("C"));
jump = jump*(!lock);

if(key_down and !can_fall and !lock){
	can_fall = true;
	alarm[0] = room_speed/4;
}

hs_speed = lerp(hs_speed, 0, deccel);

if(horizontal_speed != 0){
	if(!lock) hs_speed = lerp(hs_speed, hs_max_speed*horizontal_speed, accel);
	image_xscale = horizontal_speed;
}

if(place_meeting(x+hs_speed,y,obj_wall)){
	x = round(x);
	while(!place_meeting(x+sign(hs_speed),y,obj_wall)){
		x += sign(hs_speed);
	}
	hs_speed = 0;
}

x += hs_speed;

vs_speed += grv;

//Vertical Collision


on_floor = false;
can_jump--;

var onWall = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+1,obj_wall,false,false);
if(onWall != noone){
	vs_speed = jump*-jump_power;
	if(!jump) can_jump = jump_buffer; else can_jump = 0;
	on_floor = true;
}

var onPlataform = collision_rectangle(bbox_left+1,bbox_bottom,bbox_right-1,bbox_bottom+vs_speed,obj_plataform,false,false);
if(onPlataform != noone) and (!can_fall) and (vs_speed > 0){
	if(onPlataform.image_index == onPlataform.image_number-1) and (onPlataform.visible){
	var clipping = instance_place(x,y,obj_plataform);
	if(clipping != noone){
		if(onPlataform != clipping){
			vs_speed = jump*-jump_power;
			if(!jump) can_jump = jump_buffer; else can_jump = 0;
			on_floor = true;
		}
	}else{
	vs_speed = jump*-jump_power;
	if(!jump) can_jump = jump_buffer; else can_jump = 0;
	on_floor = true;
	}
	}
}


if(can_jump > 0) and (!on_floor) and (jump){
	can_jump = 0;
	vs_speed = jump*-jump_power;
	jump = -1;
}

if(place_meeting(x,y+vs_speed,obj_wall)){
	y = round(y);
	while(!place_meeting(x,y+sign(vs_speed),obj_wall)){
		y += sign(vs_speed);
	}
	vs_speed = 0;
}

y += vs_speed; 

if(horizontal_speed != 0) and (!lock){
	sprite_index = spr_player_walking;
	flash_sprite = spr_player_walking_flash;
}else if(hs_speed < hs_max_speed){
	sprite_index = spr_player_slowing;
	flash_sprite = spr_player_slowing_flash;
	if(hs_speed < 1){
		sprite_index = spr_player_stop;
		flash_sprite = spr_player_stop_flash
	}
}

if(vs_speed < 0){
	sprite_index = spr_player_up;
	flash_sprite = spr_player_up_flash;
}
if(vs_speed > 0){
	sprite_index = spr_player_down;
	flash_sprite = spr_player_down_flash;
}

if(iframe) and (hit_flash == 1){
var iframe_time = alarm_get(1);
flash_decrease = (hit_flash/iframe_time)/2;
hit_flash -= flash_decrease;
}else{
hit_flash = clamp(hit_flash-flash_decrease,0,1);	
}

if(global.player_hp <= 0) and (!dead){
	obj_manager.shake_magnitude = obj_manager.shake_max_magnitude*2;
	hit_flash = 1;
	var ScreenFreezeTime = room_speed*5;
	ScreenFreeze(ScreenFreezeTime);
	visible = false;
	repeat(100){
		var death_particle = instance_create_layer(x,y,"BottomParticles",obj_particle);
		death_particle.particle_owner = id;
		var side_offset = random_range(-sprite_width/2,sprite_width/2)
		death_particle.x = x+side_offset;
		death_particle.y = y+random_range(-sprite_height/4,sprite_height/4);
		death_particle.sprite_index = spr_death_particle;
		death_particle.image_speed = 0;
		death_particle.image_index = irandom(death_particle.image_number-1);
		death_particle.direction = 90+(random_range(0,90)*sign(side_offset));
		death_particle.speed = irandom(2)+1;
		death_particle.vspeed -= 3;
		death_particle.image_xscale = sign(side_offset);
	}
		var i = 0;
	repeat(100){
		var death_particle = instance_create_layer(x,y,"BottomParticles",obj_particle);
		death_particle.particle_owner = id;
		var side_offset = random_range(-sprite_width/2,sprite_width/2)
		death_particle.x = x+side_offset;
		death_particle.y = y+random_range(-sprite_height/4,sprite_height/4);
		death_particle.sprite_index = spr_death_particle;
		death_particle.image_speed = 0;
		death_particle.image_index = irandom(death_particle.image_number-1);
		death_particle.direction = 90+(random_range(0,90)*sign(side_offset));
		death_particle.speed = (irandom(i)+1)/i;
		death_particle.vspeed -= 3+i;
		death_particle.image_xscale = sign(side_offset);
		i++
	}
	alarm[2] = ScreenFreezeTime;
	dead = true;
	with(all){
		if(variable_instance_exists(id, "get_out"))	get_out = true;
	}
	global.current_state = "DEAD";
}

if(dead){
// Deal with particles
var particle_instances = ds_list_create();
with(obj_particle){
	if(particle_owner == other.id) ds_list_add(particle_instances,id);
}

if(ds_list_size(particle_instances) <= 10) instance_destroy();

var particle_pos = 0;
repeat(ds_list_size(particle_instances)){
	var particle_id = ds_list_find_value(particle_instances,particle_pos);
	
	particle_id.vspeed += 0.2;
	if(particle_id.y > room_height) instance_destroy(particle_id);
	particle_pos++;
}

ds_list_destroy(particle_instances);
}

////// Dealing with items

var my_items_size = ds_list_size(my_items)-1;

repeat(my_items_size+1){
	var current_item_id = ds_list_find_value(my_items,my_items_size);
	my_items_size--;
	if(global.items_array[current_item_id][4]){
		OnStep(current_item_id);
	}
	if(global.items_array[current_item_id][5]){
		var ds_index = 0;
		repeat(ds_list_size(clock_items)){
			var clock_array = ds_list_find_value(clock_items,ds_index);
			var clock_id = array_get(clock_array, 0);
			var clock_time = array_get(clock_array, 1);
			
			if(clock_id == current_item_id){
				var clock = OnClock(current_item_id, clock_time);
				var item_clock = [current_item_id, clock];
				ds_list_set(clock_items,ds_index,item_clock);
				break;
			}
			
			ds_index++;
		}
	}
}




