switch(choosen_gun){
	case spr_gun_weapon:
	gun_damage = 5;
	cooldown = room_speed;
	projectile_speed = 3;
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
}
show_debug_message("a");
