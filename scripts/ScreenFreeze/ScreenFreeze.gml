// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenFreeze(FreezeTime){
	var TimeFreeze = FreezeTime;
	var time = current_time + TimeFreeze;
	while(current_time < time){ }
}