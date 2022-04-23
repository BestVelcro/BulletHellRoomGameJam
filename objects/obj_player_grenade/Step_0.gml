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

image_angle += (sign(hspeed)/2)*-1;

var particles = 0;
with(obj_particle){
	if(particle_owner == other.id){
	speed = lerp(0,speed, 0.9)
	image_alpha -= random(1)/20;
	image_color = make_color_rgb(255,green,blue);
	if(blue > 0) blue = clamp(blue - random(30), 0, 255);else green = clamp(green - 10, 0, 255);
	if(image_alpha <= 0) instance_destroy();
	particles++;
	}
}

if(exploded) and (particles <= 0){
instance_destroy();	
}

if(!trigger){
	if(place_meeting(x,y,obj_enemy_gun)) or (place_meeting(x,y,obj_enemy_gun_roof)) or (place_meeting(x,y,obj_ground_gun)){
		trigger = true;
		stop = true;
		speed = 0;
		alarm[0] = 1;
	}
}

