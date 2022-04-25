if(!instance_exists(obj_player)){
visible = true;
alpha += 0.05;
}else if(global.current_state == "DEAD"){
visible = true;
alpha += 0.05;
}
if(visible){
audio_sound_gain(global.music_id,0,room_speed);	
}
