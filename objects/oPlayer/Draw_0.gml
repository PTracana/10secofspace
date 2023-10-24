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
	