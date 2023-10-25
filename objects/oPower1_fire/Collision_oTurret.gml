with(other){
	hp --;
	flash = 3;
	audio_play_sound(sndFireImpact,0,false);
}

instance_destroy();