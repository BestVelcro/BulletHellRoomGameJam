
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);

draw_sprite_ext(flash_sprite,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,hit_flash);

draw_set_halign(fa_center);

draw_text(x,y-35,string(global.player_hp));

draw_set_halign(fa_left);


if(old_health != global.player_hp){
//show_debug_message("Damage taken: "+string(old_health-global.player_hp));
}

old_health = global.player_hp;
