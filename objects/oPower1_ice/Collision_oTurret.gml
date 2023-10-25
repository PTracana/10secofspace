with(other){
	hp --;
	flash = 3;
	audio_play_sound(sndIceImpact,0,false);
}

instance_destroy();