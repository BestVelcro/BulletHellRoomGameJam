switch(choosen_gun){
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
	laseroffset_x = sprite_get_xoffset(choosen_gun);
	laseroffset_y = sprite_get_yoffset(choosen_gun);

if(!gun_side){
  if(laser_endpoint <= 180){
  laser_endpoint = cannon_angle-laser_endpoint;
  }else{
  laser_endpoint = cannon_angle+(360-laser_endpoint);
  }
}

