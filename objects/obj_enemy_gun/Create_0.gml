x = room_width/2;
y = room_height/2;
hit = 0;
gun_side = 0;
cannon_angle = 0;
startup = true;
x_startup_offset_support = sprite_width;
random_gun = choose(spr_gun_weapon,spr_gun_minigun,spr_gun_rpg,spr_gun_laser);
sprite_index = random_gun;
image_speed = 0;
x_startup_offset_cannon = sprite_get_width(random_gun)*2;
default_cannon_x = x_startup_offset_cannon;
mask_index = spr_gun_support;
aim_target = 0;
aim_current_direction = cannon_angle;

get_out = false;

can_shoot = true;
cooldown = room_speed;
projectile_speed = 10;
projectile_offset = [0,0];
cannon_speed = 1;
bullet_sprite = spr_bullet_pistol;
can_home = false;
bullet_limit = 9999;
bullets_fired = 0;
gun_precision = 10;
laser = false;
laser_x = 0;
laser_y = 0;

laseroffset_x = 0;
laseroffset_y = 0;

laser_gun = false;
switch(random_gun){
	case spr_gun_weapon:
	cooldown = room_speed;
	projectile_speed = 6;
	bullet_sprite = spr_bullet_pistol;
	break;
	case spr_gun_minigun:
	cooldown = room_speed/8;
	projectile_speed = 8;
	projectile_offset = [-3,3];
	cannon_speed = 0.5;
	gun_precision = 10;
	bullet_sprite = spr_bullet_small;
	bullet_limit = 20;
	break;
	case spr_gun_rpg:
	cooldown = room_speed*4;
	projectile_speed = 2;
	cannon_speed = 0.3;
	bullet_sprite = spr_bullet_rpg;
	can_home = true;
	bullet_limit = 3;
	gun_precision = 30;
	break;
	case spr_gun_laser:
	laser = true;
	laser_x = 20;
	laser_y = 1;
	cooldown = 1;
	projectile_speed = 6;
	cannon_speed = 1;
	gun_precision = 5;
	bullet_sprite = spr_bullet_sniper;
	laser_gun = true;
	break;
}
	laseroffset_x = sprite_get_xoffset(random_gun);
	laseroffset_y = sprite_get_yoffset(random_gun);
	length_laser = 0;
	laser_startup = 4;
	laser_endpoint = 45;
