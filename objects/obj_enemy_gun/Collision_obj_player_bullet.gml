if(!get_out) and (!startup){
hit = 1;
turret_health -= other.damage;
instance_destroy(other);
show_debug_message(string(turret_health));
}
