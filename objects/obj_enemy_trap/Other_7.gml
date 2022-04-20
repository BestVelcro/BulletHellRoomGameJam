if(trap_type == "SPIKE"){
if(sprite_index == spr_spike){
sprite_index = spr_spike_retract;
image_speed = 0;
image_index = 0;
alarm[0] = room_speed;
show_debug_message("test");
}else{
sprite_index = spr_spike;
image_speed = 0;
image_index = 0;
}
}
