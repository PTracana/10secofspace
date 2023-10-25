with (other) {
	if (oPlayer.sprite_index == sPlayerW) && (invulnerability_frames < 0) {
		hp --;
		flash = 3;
		invulnerability_frames = 20;
		audio_play_sound(sndHit,0,false);
	}
}

