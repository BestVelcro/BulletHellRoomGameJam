if(killed){
	repeat(coin_amount*global.coin_multiplier){
	var coin = instance_create_layer(x,y+10,"BottomParticles",obj_coin);	
	coin.vspeed -= random(1);
	}
}
