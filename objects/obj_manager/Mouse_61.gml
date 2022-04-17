global.gun_number_size -= 2;
global.gun_number_current_size = global.gun_number_size;
instance_destroy(obj_enemy_gun);
instance_create_layer(x,y,"Guns",obj_enemy_gun);
