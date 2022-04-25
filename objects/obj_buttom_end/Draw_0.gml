draw_self();

draw_set_halign(fa_center)
if(global.current_state == "FINAL"){
	draw_text(room_width/2,room_height/2-(room_height/4), "Congratulations! You beat all 6 Rounds!");	
	draw_text(room_width/2,room_height/2+15-(room_height/4), "Thanks you so much for Playing!");
	draw_text(room_width/2,room_height/2+30-(room_height/4), "And i'm sorry for the possible headache when playing this game");	
	draw_text(x,y-10-sprite_height, "Click me if you want to continue endless");
}
draw_set_halign(fa_left)
