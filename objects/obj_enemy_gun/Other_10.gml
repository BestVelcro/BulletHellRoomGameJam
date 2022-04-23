switch(choosen_gun){
	case spr_gun_weapon:
	cooldown = room_speed;
	projectile_speed = 6;
	bullet_sprite = spr_bullet_pistol;
	gun_damage = 10;
	turret_health = 60;
	coin_amount = 2;
	break;
	case spr_gun_minigun:
	cooldown = room_speed/8;
	projectile_speed = 7;
	projectile_offset = [-3,3];
	cannon_speed = 0.2;
	gun_precision = 10;
	bullet_sprite = spr_bullet_small;
	bullet_limit = 80;
	gun_damage = 5;
	turret_health = 80;
	coin_amount = 3;
	break;
	case spr_gun_rpg:
	cooldown = room_speed*4;
	projectile_speed = 4;
	cannon_speed = 0.3;
	bullet_sprite = spr_bullet_rpg;
	can_home = false;
	bullet_limit = 3;
	gun_precision = 30;
	gun_damage = 60;
	turret_health = 140;
	coin_amount = 5;
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
	gun_damage = 25;
	turret_health = 100;
	coin_amount = 2;
	break;
}
	laseroffset_x = sprite_get_xoffset(choosen_gun);
	laseroffset_y = sprite_get_yoffset(choosen_gun);

if(!gun_side){
  if(laser_endpoint <= 180){
  laser_endpoint = cannon_angle-laser_endpoint;
  }else{
  laser_endpoint = cannon_angle+(360-laser_endpoint);
  }
}

