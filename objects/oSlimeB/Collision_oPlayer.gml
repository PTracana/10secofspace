with (other) {
	if (oPlayer.sprite_index != sPlayerW) && (oPlayer.sprite_index != sPlayerAb) && (invulnerability_frames < 0)  {
		hp --;
		flash = 3;
		invulnerability_frames = 60;
	}
}

