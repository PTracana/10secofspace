if (place_meeting(x, y, oWall)){
	audio_play_sound(sndIceImpact,0,false);
	instance_destroy();
}
