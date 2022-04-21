trap_type = "LANDMINE";
image_speed = 0;
trigger = false;
exploded = false;
explosion_offset_x = 0;
explosion_offset_y = 0;
//alarm[1] = 1;
spin_plataform = noone;
created = false;
trap_damage = 5;
visible = false;

lock_x = x;
lock_y = y;

y_offset = sprite_get_height(spr_wall)+irandom(10);

blade_size = 0;
