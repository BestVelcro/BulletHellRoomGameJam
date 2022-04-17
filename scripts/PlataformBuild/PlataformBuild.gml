// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlataformBuild(){
var starting_y = (room_height/2)-(room_height/4);
var starting_x = (room_width/2)-(room_width/4);
var x_count = 0;
var y_count = 0;
var bottom_plataform = false;
var visible_status = false;
repeat(global.plataform_count){
	var plataform = instance_create_layer(x,y,"Cenario",obj_plataform);
	plataform.visible = irandom(1);
	plataform.image_xscale = 30;
	plataform.image_yscale = 5;
	if(x_count < 3){
	plataform.x = starting_x+((room_width/4)*x_count);
	}else{
	x_count = 0;
	y_count++;
	plataform.x = starting_x+((room_width/4)*x_count);
	}
	plataform.y = starting_y+((room_height/4)*y_count);
	x_count++;
	if(y_count == 2){
		visible_status = irandom(1);
		plataform.visible = visible_status;
		bottom_plataform = clamp(bottom_plataform+visible_status,0,1);
		if(x_count == 2) and (!bottom_plataform){
		plataform.visible = true;	
		}
	}
}
}