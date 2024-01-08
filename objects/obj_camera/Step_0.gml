/// @description follow the player

if (instance_exists(target))
{
	camera_x = target.x - (camera_width / 2);
	camera_y = target.y - (camera_heigth / 2);
	
	camera_x = clamp(camera_x, 0, room_width - camera_width);
	camera_y = clamp(camera_y, 0, room_height - camera_heigth);
}

camera_set_view_pos(view_camera[0], camera_x, camera_y);