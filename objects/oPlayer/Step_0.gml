//player input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_attack = keyboard_check(vk_enter) || mouse_check_button(mb_left);
var key_power = keyboard_check(ord("E")) || mouse_check_button(mb_right);
var key_power_absorb = keyboard_check(vk_shift);
var key_jump = keyboard_check(vk_space);

//movement calc
var move = key_right - key_left; 

hsp = move * walksp;
vsp = vsp + grv;
camera = camera_get_default();
invulnerability_frames --;
power1_delay --;

//check if alive
/*if (oPlayer.hp == 0) {
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_font(fDied);
	draw_text(700,285, "YOU DIED");
	instance_deactivate_all(true);
}*/

//lose power 1
if (power1_stacks == 0 || time == 0) {
	oBarPower.image_index = 1;
}

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
			
		} else if (key_power) && (power1_delay < 0){
			sprite_index = sPower1;
			
			if (sprite_index == sPower1 && image_index == 2 && power1_stacks != 0){
				power1_stacks --;
				power1_delay = 10;
				if (oBarPower.image_index == 2) {
					with (instance_create_layer(x + 10, y , "Projectiles", oPower1_fire)) {
						speed = 15;
						other.time --;
						if (other.image_xscale == -1){
							direction = 180;
							image_xscale = -1;
						} 
					}
				}
			} else if (sprite_index == sPower1 && image_index == 2 && power1_stacks != 0){
				power1_stacks --;
				power1_delay = 10;
				if (oBarPower.image_index == 3) {
					with (instance_create_layer(x + 10, y , "Projectiles", oPower1_ice)) {
						speed = 15;
						other.time --;
						if (other.image_xscale == -1){
							direction = 180;
							image_xscale = -1;
						} 
					}
				}
			}
		} else if (key_power_absorb) && (time > 0){
			sprite_index = sPlayerAb;
		
		} else {
			sprite_index = sPlayer;
		}	
		
	} else {
		sprite_index = sPlayerR;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);

