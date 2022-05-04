if(!stop) v_speed += 0.2;

if(place_meeting(x,y+v_speed,obj_wall)) and (!stop){
	v_speed = (v_speed*-1)/1.5;
	h_speed = h_speed/1.25
	if(abs(v_speed) < 1){
		v_speed = 0;
		stop = true;
		alarm[0] = room_speed;
	}
	if(abs(h_speed) < 0.4) h_speed = 0;
	//y += sign(room_height/2-x)*2;
}

y += v_speed;

if(place_meeting(x+h_speed,y,obj_wall)) and (!stop){
	x = round(x);
	while(!place_meeting(x+sign(h_speed),y,obj_wall)){
		x += sign(h_speed);
	}
	h_speed = h_speed*-1;
	image_xscale = sign(h_speed);
}

x += h_speed;

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
