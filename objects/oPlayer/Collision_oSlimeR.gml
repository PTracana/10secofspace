with (other) {
	invulnerability_frames --;
	if (oPlayer.sprite_index == sPlayerW) && (invulnerability_frames < 0) {
		hp --;
		flash = 3;
		invulnerability_frames = 5;
	}
}


