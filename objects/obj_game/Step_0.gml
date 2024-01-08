/// @description 

// handle death event
if (waiting_for_restart == false and lives <= 0)
{	
	if (instance_exists(obj_player)) 
	{
		instance_destroy(obj_player);
	}
	
	if (instance_exists(obj_follower))
	{
		with(obj_follower) {
			event_perform(ev_other, ev_user14);
		}
	}
	
	instance_create_layer(obj_camera.camera_x + obj_camera.camera_width / 2,
		obj_camera.camera_y + obj_camera.camera_heigth / 2,
		"Instances", obj_gameover);
		
	waiting_for_restart = true;
}

