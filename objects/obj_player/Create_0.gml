hs_speed = 0;
hs_max_speed = 5;
vs_speed = 0;
accel = 0.3;
deccel = 0.2;
grv = 0.5;
jump_power = 8;
can_fall = false;

can_jump = 0;
on_floor = false;

jump_buffer = 6;

iframe = false;

hit_flash = 0;
flash_decrease = 0;
flash_sprite = spr_player_stop_flash;

old_health = global.player_hp;

dead = false;

clock_items = ds_list_create();

my_items = ds_list_create();
