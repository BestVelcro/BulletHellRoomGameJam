if(!stop) vspeed += 0.2;

if(place_meeting(x,y+vspeed,obj_wall)) and (!stop){
	y = round(y);
	while(!place_meeting(x,y+sign(vspeed),obj_wall)){
		y += sign(vspeed);
	}
	vspeed = (vspeed*-1)/1.5;
	hspeed = hspeed/1.25
	if(abs(vspeed) < 1){
		vspeed = 0;
		stop = true;
		alarm[0] = room_speed/2;
	}
	if(abs(hspeed) < 0.4) hspeed = 0;
	y += sign(vspeed);
}
if(place_meeting(x+hspeed,y,obj_wall)) and (!stop){
	x = round(x);
	while(!place_meeting(x+sign(hspeed),y,obj_wall)){
		x += sign(hspeed);
	}
	hspeed = hspeed*-1;
	image_xscale = sign(hspeed);
}

if(fade_away){
image_alpha -= 0.05;
if(image_alpha <= 0) instance_destroy();
}

with(obj_particle){
	if(particle_owner == other.id){
		speed -= 0.05;
		image_alpha -= 0.02;
		if(image_alpha <= 0) instance_destroy();	
	}
}
