// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlataformBuild(random_plataforms){
var starting_y = (room_height/2)-(room_height/4)+(room_height/16);
var starting_x = (room_width/2)-(room_width/4);
var x_count = 0;
var y_count = 0;
var layer_plataform = false;
var visible_status = false;
repeat(global.plataform_count){
	var plataform = instance_create_layer(x,y,"Plataforms",obj_plataform);
	visible_status = 1;
	if(random_plataforms) visible_status = irandom(1);
	plataform.visible = visible_status;
	if(x_count < 3){
	plataform.x = round(starting_x+((room_width/4)*x_count));
	}else{
	x_count = 0;
	y_count++;
	layer_plataform = false;
	plataform.x = round(starting_x+((room_width/4)*x_count));
	}
	plataform.y = round(starting_y+((room_height/4.5)*y_count));
	x_count++;
	/////////////////// This Prevents a layer with no plataforms
		plataform.visible = visible_status;
		layer_plataform = clamp(layer_plataform+visible_status,0,1);
		if(x_count == 3) and (!layer_plataform){
		plataform.visible = true;	
	///////////////
	}
	if(x_count == 2) and (y_count == 1){
		plataform.visible = true;	
	}
	if(!random_plataforms){
		if(y_count == 2) plataform.visible = true;else plataform.visible = false;
	}
}
}