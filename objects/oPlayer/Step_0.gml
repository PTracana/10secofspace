//player input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_attack = keyboard_check(vk_enter);
var key_jump = keyboard_check(vk_space);

//movement calc
var move = key_right - key_left; 

hsp = move * walksp;
vsp = vsp + grv;

attack_delay = attack_delay - 1;
//attack animation
if (key_attack) && (place_meeting(x, y + 1, oWall)) {
	if (attack_delay < 0) {
		instance_activate_object(oWeapon);
		image_speed = 0.9;
		sprite_index = sPlayerW;
		
		if (oPlayer.image_xscale > 0) {
			instance_create_layer(oPlayer.x + 45, oPlayer.y - 65, "Weapon", oWeapon);
			instance_create_layer(oPlayer.x + 42, oPlayer.y + 15, "Weapon", oWeapon);
		} 
		else {
			weapon = instance_create_layer(oPlayer.x - 45, oPlayer.y - 65, "Weapon", oWeapon);
			weapon.image_xscale = -1;
			weapon = instance_create_layer(oPlayer.x - 42, oPlayer.y + 15, "Weapon", oWeapon);
			weapon.image_xscale = -1;
		} 
		attack_delay = 20;
	}
	
} else {

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

	} 
	else {
		image_speed = 1;
	
		if (hsp == 0) {
			sprite_index = sPlayer;

		} 
		else {
			sprite_index = sPlayerR;		
		
		}
	}

	if (hsp != 0) image_xscale = sign(hsp);
}
