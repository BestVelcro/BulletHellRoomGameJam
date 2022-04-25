draw_sprite_part(sprite_index,0,0,0,sprite_width,sprite_show,x-(sprite_width/2),y-(sprite_height/2));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var text_height = string_height("MLPI");
draw_text_color(x,y-(sprite_height/2)-(text_height/2),string(global.items_array[random_item][0]),draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color(),alpha);
draw_sprite_part(global.items_array[random_item][2],0,0,0,sprite_width,sprite_show,x-(sprite_width/2),y-(sprite_height/2));
draw_set_valign(fa_top);
draw_text_ext_color(x,y+(sprite_height/2)-(text_height/8)+(text_height/4),string(global.items_array[random_item][1]),text_height,sprite_width*4,draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color(),alpha);
draw_set_color(c_black);
draw_sprite_ext(spr_coin,0,x-((sprite_get_width(spr_coin)*2)/2),y-(sprite_height/2)-(text_height*1.6)+((sprite_get_height(spr_coin)*2)/2),2,2,0,c_white,alpha);
draw_text_ext_color(x,y-(sprite_height/2)-(text_height*1.6)-(text_height/4),string(global.items_array[random_item][6]),text_height,sprite_width*4,draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color(),alpha);
draw_set_font(ItemFont);
draw_set_halign(fa_left);
draw_set_color(c_white);

