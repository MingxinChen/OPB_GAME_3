/// @description 

randomize();

default_lives = 1;

score = 0;
lives = default_lives;

tiles_background = undefined;
tiles_block = undefined;
tiles_ground = undefined;

enum FACTIONS {
	ENEMY,
	AUTOBOTS,
	NETURAL
}

last_saving_point_x = undefined;
last_saving_point_y = undefined;

waiting_for_restart = false;


