vsp = vsp + grv;
invulnerability_frames --;
laser_delay --;
move_again --;

if ((move_again == 0)) {
	hsp = sign(last_direction);
}

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
	image_speed = 0;
	
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;

} else {
	if ((place_meeting(x - 400, y, oPlayer)) || (place_meeting(x - 100, y, oPlayer))) {
		if ((image_xscale == -1) && (other.laser_delay < 0)) {
			image_speed = 0;
			with (instance_create_layer(x - 85, y - 35, "Projectiles", oTurret_blast)) {
				audio_play_sound(sndLaser,0,false);
				other.laser_delay = 120;
				other.move_again = 60;
				other.last_direction = -1;
				other.hsp = 0;
				speed = 15;
				direction = 180;
				image_xscale = -1;
				
			}
		}
	}
	else if ((place_meeting(x + 400, y, oPlayer)) || (place_meeting(x + 100, y, oPlayer))) {
		if ((image_xscale == 1) && (other.laser_delay < 0)) {
			image_speed = 0;
			with (instance_create_layer(x + 85, y - 35, "Projectiles", oTurret_blast)) {
				audio_play_sound(sndLaser,0,false);
				other.laser_delay = 120;
				other.move_again = 60;
				other.last_direction = 1;
				other.hsp = 0;
				speed = 15;
			}
		}
	} else {
		image_speed = 1;
		sprite_index = sTurret;		
	}
}

if (hsp != 0) image_xscale = sign(hsp);



