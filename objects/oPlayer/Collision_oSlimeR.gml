with (other) {
	if (oPlayer.sprite_index == sPlayerW) && (invulnerability_frames < 0) {
		hp --;
		flash = 3;
		invulnerability_frames = 20;
		audio_play_sound(sndHit,0,false);
	}
	if (oPlayer.sprite_index == sPlayerAb) {
		other.invulnerability_frames = 60;
		other.absorb_counter --;
		oBarPower.image_index = 2;
		other.power1_stacks = other.time;
		
		if(other.absorb_counter < 0){
			other.absorb_counter = 60;
			
			if(other.time != 0){
				other.time --;
			}
		}
		
	}
}


