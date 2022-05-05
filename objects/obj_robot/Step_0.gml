v_speed += 0.3;

if(place_meeting(x,y+v_speed,obj_wall)){
y = round(y);
while(!place_meeting(x,y+sign(v_speed),obj_wall)){
	y += sign(v_speed);	
}
v_speed = 0;
}

y += v_speed;

if(place_meeting(x+h_speed,y,obj_wall)){
	x = round(x);
	while(!place_meeting(x+sign(h_speed),y,obj_wall)){
		x += sign(h_speed);	
	}
	h_speed = h_speed *-1;
	image_xscale = sign(h_speed);
}

x += h_speed;


var check_near = [instance_nearest(x,y,obj_enemy_gun),instance_nearest(x,y,obj_ground_gun),instance_nearest(x,y,obj_enemy_gun_roof)];
var object_distance = room_width*99;
var enemy_distance = (room_width*99)+1;
var distance_check = 0;
var nearest_object = noone;
var i = 0;

var enemy_count = 0;
repeat(array_length(enemy_array)){
	with(enemy_array[enemy_count]){
		enemy_distance = point_distance(x, y, other.x, other.y);
		if(enemy_distance < object_distance) and (visible) and (sprite_index != spr_nothing){
			object_distance = enemy_distance;
			nearest_object = id;
		}
	}
enemy_count++;
}

var destiny = 999;
if(nearest_object != noone){
destiny = point_direction(x,y-sprite_height+3,nearest_object.x,nearest_object.y);
direction += sign(angle_difference(destiny,direction))*2;	
}

if(!gun_freeze) and (image_index != last_frame){
gun_frame++;
}
if(gun_freeze) gun_frame = 0;
last_frame = image_index;

if(can_shoot) and (abs(angle_difference(destiny,direction)) < 1) and (instance_exists(obj_player_gun)){
	can_shoot = false;
	alarm[0] = room_speed;
	
	var bullet = instance_create_layer(x,y-sprite_height+3,"BottomParticles",obj_player_gun.bullet_shot);
	bullet.direction = direction;
	bullet.speed = obj_player_gun.bullet_speed;
	bullet.image_angle = bullet.direction;
	bullet.damage = ceil(global.player_damage/2)+5;
}

hit -= 0.04;
