// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FloorCollision(obj, jump_key, plataform){
	var fall = false;
	if(plataform){
		if(vs_speed > 0){
		if(!place_meeting(x,y,obj)){
			fall = true;
		}
		}
	}else{
	fall = true;	
	}
	
	if(fall){
	y = round(y);
	while(!place_meeting(x,y+sign(vs_speed),obj)){
		y += sign(vs_speed);
	}
	vs_speed = 0;
	}
}