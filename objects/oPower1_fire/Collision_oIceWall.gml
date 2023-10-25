with(other){
	hp --;
	audio_play_sound(sndFireImpact,0,false);
	if(hp == 0){
		instance_destroy();
		audio_play_sound(sndIceMelt,0,false);
	}
}
instance_destroy();
