draw_set_font(ItemFont);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite_ext(spr_coin,0,15,13+((sprite_get_height(spr_coin))/4),2,2,0,c_white,1);
draw_text(10+(sprite_get_width(spr_coin)*2),3,string(global.coins));

var bar_size = global.player_max_hp*1.5

draw_sprite_stretched(spr_healthbar_bg,1,room_width/2-(bar_size/2),2,bar_size,sprite_get_height(spr_healthbar_bg));

draw_sprite_stretched(spr_healthbar_pg,0,room_width/2-(bar_size/2),2,bar_size/(global.player_max_hp/global.player_hp),sprite_get_height(spr_healthbar_bg));
if(instance_exists(obj_player)){
draw_sprite_stretched_ext(spr_healthbar_pg,1,room_width/2-(bar_size/2),2,bar_size/(global.player_max_hp/global.player_hp),sprite_get_height(spr_healthbar_bg),c_white,obj_player.hit_flash);
}
draw_sprite_stretched(spr_healthbar_bg,0,room_width/2-(bar_size/2),2,bar_size,sprite_get_height(spr_healthbar_bg));

