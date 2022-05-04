if(!other.exploded){
var bullet_angle = other.direction;
var bullet_sprite = other.sprite_index;
var bullet_damage = other.bullet_damage;
var bullet_x = other.x;
var bullet_y = other.y;
instance_destroy(other);
var player_bullet = instance_create_layer(bullet_x,bullet_y,"PlayerGun",obj_player_bullet);
player_bullet.direction = bullet_angle+180;
player_bullet.sprite_index = bullet_sprite;
player_bullet.image_angle = player_bullet.direction;
var player_bullet_speed = 2;
with(obj_player_gun){
player_bullet_speed = bullet_speed;	
}
player_bullet.speed = player_bullet_speed*1.5;
player_bullet.damage = bullet_damage*2;
}
