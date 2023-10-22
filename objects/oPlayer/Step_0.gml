//player input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_attack = keyboard_check(vk_enter) || mouse_check_button(mb_left);
var key_jump = keyboard_check(vk_space);

//movement calc
var move = key_right - key_left; 

hsp = move * walksp;
vsp = vsp + grv;


//jump
if (place_meeting(x, y + 1, oWall)) && (key_jump) {
	vsp = -10;
}

//horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//vertical collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animations
if (!place_meeting(x, y + 1, oWall)) {
	sprite_index = sPlayerA;
	image_speed = 0;
	
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;

} else {
	image_speed = 1;
	
	if (hsp = 0){
		if(key_attack){
			sprite_index = sPlayerW;
		} else {
			sprite_index = sPlayer;
		}	
		
	} else {
		sprite_index = sPlayerR;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);

