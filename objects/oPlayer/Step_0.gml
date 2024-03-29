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
absorb_delay_sound --;

if (hp == 0) {
	death_height = y;
	death_width = x;
	oPlayer.image_alpha = 0;
	instance_destroy(oSlimeB);
	instance_destroy(oSlimeR);
	instance_destroy(oTurret);
	oBarHp.image_alpha = 0;
	oBarTime.image_alpha = 0;
	oBarPower.image_alpha = 0;
	hsp = 0;
	vsp = 0;
	restart = true;
}

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
if (place_meeting(x + hsp, y, oFlameWall)) {
	while (!place_meeting(x + sign(hsp), y, oFlameWall)) {
		x = x + sign(hsp);
	}
	if (invulnerability_frames < 0){
		hp --;
		flash = 3;
		invulnerability_frames = 60;
	}
	hsp = 0;
}

if (place_meeting(x + hsp, y, oIceWall)) {
	while (!place_meeting(x + sign(hsp), y, oIceWall)) {
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
			
			if (image_index == 2 && power1_stacks != 0){
				power1_stacks --;
				power1_delay = 10;
				if (oBarPower.image_index == 2) {
					audio_play_sound(sndFireshot,0,false);
					with (instance_create_layer(x + 10, y , "Projectiles", oPower1_fire)) {
						speed = 15;
						other.time --;
						if (other.image_xscale == -1){
							direction = 180;
							image_xscale = -1;
						}
					}
				} else if (oBarPower.image_index == 3){
					audio_play_sound(sndIceShot,0,false);
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
		}
		else if (key_power_absorb) && (time > 0){
			sprite_index = sPlayerAb;
			if(absorb_delay_sound < 0) {
				audio_play_sound(sndPowerCharge,0,false,1,0,random_range(0.9,1));
				absorb_delay_sound = 50;
			}
		
		} else {
			sprite_index = sPlayer;
		}
	} else {
		sprite_index = sPlayerR;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);

