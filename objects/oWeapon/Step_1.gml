/*
instance_deactivate_object(oWeapon);
image_angle = 0;

//checks which way the character is looking at
if (oPlayer.image_xscale < 0) {
	image_xscale = -1;
	x_pos0 = -42;
	x_pos1 = -47;
	angle0 = 45;

} else {
	image_xscale = 1;
	x_pos0 = 42;
	x_pos1 = 47;
	angle0 = -45;
}

//does the animation attack
if (oPlayer.sprite_index == sPlayerW) {
	
	if (sPlayerW.image_index == 0) {
		var weapon = instance_create_layer(oPlayer.x + x_pos1, oPlayer.y + y_pos1, "oWeapon", oWeapon);
		//x = oPlayer.x + x_pos0;
		//y = oPlayer.y + y_pos0;
		weapon = 0;
		 

	} else {
		var weapon = instance_create_layer(oPlayer.x + x_pos0, oPlayer.y + y_pos0, "oWeapon", oWeapon);
		//x = oPlayer.x + x_pos1;
		//y = oPlayer.y + y_pos1;
		weapon = angle0;
	
	}
}
*/



