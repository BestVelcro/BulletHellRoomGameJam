draw_sprite(spr_gun_sniper_support,0,x,y+y_offset);

draw_sprite_ext(spr_gun_sniper_support,1,x,y+y_offset,image_xscale,image_yscale,image_angle,c_white,hit);

draw_sprite_ext(spr_gun_sniper,0,x+x_recoil,y+y_offset-sprite_width+y_recoil,image_xscale,sniper_yscale,sniper_angle,c_white,1);
