if (oPlayer.time <= 6) {
	oPlayer.time += 4; 
} else {
	oPlayer.time = 10;
}
audio_play_sound(sndGetItem,0,false);
instance_destroy();