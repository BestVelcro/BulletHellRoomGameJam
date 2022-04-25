speed = 0;
if(instance_exists(obj_player_gun)){
var x_length = ((obj_player_gun.sprite_width/2)*obj_player_gun.image_yscale);
var x_lengthdir = lengthdir_x(abs(x_length),image_angle);
var y_lengthdir = lengthdir_y(abs(x_length),image_angle);
x = obj_player_gun.x+x_lengthdir;
y = obj_player_gun.y+y_lengthdir;

}else{
	instance_destroy();
}

with(obj_enemy_gun){
	if(place_meeting(x,y,obj_sword_swing)){
	if(!get_out) and (!startup){
	hit = 1;
	turret_health -= other.damage;
	instance_destroy(other);
	}
	}
}
with(obj_enemy_gun_roof){
	if(place_meeting(x,y,obj_sword_swing)){
		if(!get_out) and (!startup){
		hit = 1;
		turret_health -= other.damage;
		instance_destroy(other);
		}
	}
}
with(obj_ground_gun){
	if(place_meeting(x,y,obj_sword_swing)){
	if(!get_out) and (!startup){
	hit = 1;
	turret_health -= other.damage;
	instance_destroy(other);
	}
	}
}
