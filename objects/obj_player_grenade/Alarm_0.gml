speed = 0;
visible = false;
var enemy_count = 0;
StartExplosion(x, y, id, 60, 0.4, id)
repeat(array_length(collision_array)){
	with(collision_array[enemy_count]){
		if(StartExplosion(other.x, other.y, id, 60, 0.4, other.id)){
			if(!get_out) and (!startup){
			hit = 1;
			turret_health -= other.damage;
			}	
		}
	}
	enemy_count++;
}
exploded = true;
