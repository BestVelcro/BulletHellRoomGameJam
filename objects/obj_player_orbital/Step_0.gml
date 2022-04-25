if(instance_exists(lock_target)){
var dir_x = lengthdir_x(lock_target.sprite_height,direction);
var dir_y = lengthdir_y(lock_target.sprite_height,direction);

x = lock_target.x+dir_x
y = lock_target.y+dir_y

direction++;
}

hit = clamp(hit-0.2,0,1);
