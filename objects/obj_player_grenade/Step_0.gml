if(!stop) vspeed += 0.2;

if(place_meeting(x,y+vspeed,obj_wall)) and (!stop){
	y = round(y);
	while(!place_meeting(x,y+sign(vspeed),obj_wall)){
		y += sign(vspeed);
	}
	vspeed = (vspeed*-1)/1.5;
	hspeed = hspeed/1.25
	if(abs(vspeed) <= 1){
		vspeed = 0;
		alarm[0] = room_speed/2;
		stop = true;
		y = round(y);
		while(!place_meeting(x,y+1,obj_wall)){
			y += 1;
		}
		y--;
	}
	if(abs(hspeed) < 0.4) hspeed = 0;
	y += sign(vspeed);
}
if(place_meeting(x+hspeed,y,obj_wall)){
	x = round(x);
	while(!place_meeting(x+sign(hspeed),y,obj_wall)){
		x += sign(hspeed);
	}
	hspeed = hspeed*-1;
	image_xscale = sign(hspeed);
}

image_angle += (hspeed)*-1;

if(exploded) and (!ExplosionParticles(id)){
instance_destroy();	
}

if(!exploded){
	var collision_count = 0;
		repeat(array_length(collision_array)){
			if(place_meeting(x,y, collision_array[collision_count])) and (!exploded){
				var enemy_count = 0;
				repeat(array_length(collision_array)){
					with(collision_array[enemy_count]){
						if(StartExplosion(other.x, other.y, id, 60, 0.4, other.id)){
							if(!get_out) and (!startup){
							hit = 1;
							turret_health -= other.damage;
							}
							other.speed = 0;
							other.visible = false;
						}
					}
					enemy_count++;
				}
				exploded = true;
			}
			collision_count++;
		}
}

