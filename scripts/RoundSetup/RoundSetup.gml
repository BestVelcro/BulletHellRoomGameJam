global.challenges = [1,2,3,4,5,6];

function RoundSetup(current_round,current_challenge){
var setup_number = irandom(array_length(global.challenges)-1);
var choosen_round = global.challenges[setup_number];
array_delete(global.challenges, setup_number,1)
}