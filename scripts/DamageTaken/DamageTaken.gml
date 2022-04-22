// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DamageTaken(damage, ignores_iframe, reduced_iframe){
	with(obj_player){
		if(!on_dash){
			if(!iframe) or (ignores_iframe){
			iframe = true;
			global.player_hp -= floor(damage*global.player_armor);	
			alarm[1] = room_speed/(8+reduced_iframe);
			hit_flash = 1;
			}
		}
	}
}