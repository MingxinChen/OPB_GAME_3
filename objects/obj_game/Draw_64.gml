/// @description 

if (room == rm_0) exit;

draw_sprite(spr_button_help, 0, 
	obj_camera.camera_width - 40, obj_camera.camera_heigth - 40);
draw_sprite(spr_button_package, 0,
	obj_camera.camera_width - 80, obj_camera.camera_heigth - 40);
	


/*
switch(room)
{
	case rm_1:
	case rm_2:
		/*draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_set_font(fnt_default);
		draw_set_valign(fa_middle);
		draw_text(20, 20, "SCORE:" + string(score));
		draw_text(20, 45, "HP:" + string(lives));

		break;
	default:
		draw_set_halign(fa_center);
		var c = c_yellow;
		draw_text_transformed_color(room_width / 2, 100, "OPB_GAME_2",
			3, 3, 0, c, c, c, c, 1);
		draw_text(room_width / 2, 300, "Autobots, ROLL OUT!");
}
