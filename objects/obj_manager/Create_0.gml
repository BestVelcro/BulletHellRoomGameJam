global.current_state = "WAIT_TIME";
global.time = room_speed;
global.clock = false;
global.current_round = 1;
global.current_challenge = 0;
global.challenges = [1,2,3,4,5,6];

global.traps = true;

global.regen = true;

global.player_max_hp = 100;
global.player_hp = global.player_max_hp;
global.player_armor = 1;

global.player_damage = 0;

global.coins = 0;
global.coin_multiplier = 1;


shake_fx = layer_get_fx("ScreenShake");
shake_max_magnitude = 5;
shake_max_speed = 3;
shake_magnitude = 0;
shake_speed = shake_max_speed;

checked = false;

randomize();
