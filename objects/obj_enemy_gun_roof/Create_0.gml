image_angle = 270;
x = room_width/2
number_of_bullets = 2;
angle_offset = 180/number_of_bullets;
starting_gun = angle_offset/2;
hit = 0;
gun_side = 0;
cannon_angle = 270;
startup = true;
y_startup_offset_support = sprite_width;
choosen_gun = spr_gun_weapon;
sprite_index = choosen_gun;
image_speed = 0;
y_startup_offset_cannon = sprite_get_width(choosen_gun)*2;
default_cannon_x = y_startup_offset_cannon;
mask_index = spr_gun_support;
aim_target = 0;
aim_current_direction = cannon_angle;

gun_damage = 15;
get_out = false;

can_shoot = true;

cooldown = room_speed;
projectile_speed = 3;
cannon_speed = 0.8;
bullet_sprite = spr_bullet_pistol;
bullet_limit = 9999;
bullets_fired = 0;
gun_precision = 90;

cannon_x = 0;
cannon_y = 0;

barrage = 4;
barrage_count = barrage;

y = sprite_get_height(spr_wall);
