	global.items_array = [
	// ["Item_Name", "Description", spr_id, Boolean (Script on Pickup), Boolean (Script on Step Event), Boolean (Clock Event), Price
	// 6 Values + index position
	["Test Item 1", "Pickup Test", spr_blade, true, false, false, 10, 0],
	["Test Item 2", "Step Test", spr_landmine, false, true, false , 20, 1],
	["Test Item 3", "Clock Test", spr_spike_retract, false, false, true, 15, 2]
	]
	

	
function OnPickup(item_id) {
	switch(item_id){
		case 0:
		global.player_max_hp += 100;
		break;
	}
}

function OnStep(item_id) {
	switch(item_id){
		case 1:
		global.player_hp++;
		break;
	}
}

function OnClock(item_id, clock_time) {
		var timer = clock_time;
	switch(item_id){
		case 2:
		if(timer > room_speed*2){
			timer = 0;
			var angle = 0;
			var bullet_amount = 180;
			repeat(bullet_amount){
				var bullet = instance_create_layer(x,y,"Guns",obj_player_bullet);
				bullet.image_angle = angle;
				bullet.direction = angle;
				bullet.speed = 2;
				bullet.damage = 20;
				angle += 360/bullet_amount;
			}
		}
		break;
	}
	timer++;
	return timer;
}
