with(other){
	hp --;
	if(hp == 0){
		instance_destroy();
		audio_play_sound(sndIceMelt,0,false);
	}
}
instance_destroy();
