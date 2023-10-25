draw_self();

if (flash > 0){
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}

if (restart)
{	
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_font(fDied);
	draw_text(death_width, death_height - 250, "YOU DIED. PRESS R TO RESTART");
}

if(place_meeting(x,y,oClosed)) {
	draw_set_font(-1);
	draw_set_color(c_purple);
	draw_text(x,y," THIS DOOR SEEMS TO BE CLOSED");
}

if(place_meeting(x,y,oElevator)) {
	draw_set_font(-1);
	draw_set_color(c_purple);
	draw_text(x,y,"  I WONDER WHAT THESE CARD SLOTS ARE FOR.\n        COULD THERE BE ANY AROUND?");
}