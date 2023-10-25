vsp = vsp + grv;
invulnerability_frames --;

//horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
}
x = x + hsp;

if (place_meeting(x + hsp, y, oIceWall)) {
	while (!place_meeting(x + sign(hsp), y, oIceWall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
}

if (place_meeting(x + hsp, y, oFlameWall)) {
	while (!place_meeting(x + sign(hsp), y, oFlameWall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
}

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
	sprite_index = sSlimeR_A;
	image_speed = 0;
	
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;

} else {
	image_speed = 1;
	
	if (hsp = 0){
		sprite_index = sSlimeR;
	} else {
		sprite_index = sSlimeR_R;		
	}
}

if (hsp != 0) image_xscale = sign(hsp);

