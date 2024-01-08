/// @description Camera setting


camera_x = 0;
camera_y = 0;
target = obj_player;

camera_width = 640; //  1280
camera_heigth = 360; //  720

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], camera_width, camera_heigth);

display_scale = 4;

display_width = display_scale * camera_width;
display_height = display_scale * camera_heigth;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);

display_set_gui_size(camera_width, camera_heigth);

alarm[0] = 1;