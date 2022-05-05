direction = 135;
speed = 2;
vspeed -= 4;
if(instance_exists(obj_player)) vspeed += obj_player.vs_speed/2;
damage = 1;
stop = false;

exploded = false;
trigger = false;

alarm[1] = 1;

collision_array = [obj_enemy_gun, obj_enemy_gun_roof, obj_ground_gun];
