draw_self();

if(!up_to) and (y_offset < sprite_get_height(spr_wall)){
draw_sprite(spr_warn,0,lock_x,lock_y-sprite_get_height(spr_warn));
}
