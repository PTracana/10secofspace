/// @description Size Variables and mode setup

w = display_get_gui_width();
h = display_get_gui_height();

h_half = h * 0.5;

enum TRANS_MODE 
{
	OFF,
	RESTART,
	GOTO,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;