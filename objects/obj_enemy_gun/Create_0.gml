x = -100;
y = -100;
hit = 0;
gun_side = 0;
cannon_angle = 0;
startup = true;
x_startup_offset_support = sprite_width;
choosen_gun = spr_gun_weapon;
sprite_index = choosen_gun;
image_speed = 0;
x_startup_offset_cannon = sprite_get_width(choosen_gun)*2;
default_cannon_x = x_startup_offset_cannon;
mask_index = spr_gun_support;
aim_target = 0;
aim_current_direction = cannon_angle;
killed = false;

audio_play = gunshot_2;

visible = false;

flash = 0;

coin_amount = 1;

health_multiplier = 1;
damage_multiplier = 1;

get_out = false;

can_shoot = false;
alarm[0] = (room_speed/2)+random(room_speed);

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
gun_damage = 600;

laseroffset_x = 0;
laseroffset_y = 0;

laser_gun = false;
laseroffset_x = sprite_get_xoffset(choosen_gun);
laseroffset_y = sprite_get_yoffset(choosen_gun);
length_laser = 0;
laser_startup = 4;
laser_endpoint = 0;

turret_health = 100;
