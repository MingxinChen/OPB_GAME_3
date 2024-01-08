/// @description 

if (waiting_for_restart == false) exit;

lives = default_lives;
waiting_for_restart = false;

instance_destroy(obj_gameover);

instance_create_layer(last_saving_point_x, last_saving_point_y,
			"Instances", obj_player);

if (instance_exists(obj_follower)) 
{
	instance_destroy(obj_follower);
	instance_create_layer(last_saving_point_x, last_saving_point_y,
		"Instances", obj_follower);
}

