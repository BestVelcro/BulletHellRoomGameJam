draw_sprite_ext(spr_restart,0,x,y,image_xscale,image_yscale,0,c_white,alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(ItemFontBig);

draw_text_color(x,y,"Restart?",c_white,c_white,c_white,c_white,alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(ItemFont);
