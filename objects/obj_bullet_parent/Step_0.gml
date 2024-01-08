/// @description 

if (!point_in_rectangle(x, y, 
	obj_camera.camera_x, obj_camera.camera_y, 
	obj_camera.camera_x + obj_camera.camera_width, 
	obj_camera.camera_y + obj_camera.camera_heigth))
{
	instance_destroy();
}
