/// @description 

if (room == rm_0) exit;

tiles_background = layer_tilemap_get_id("Tiles_background");

if (room == rm_1)
{
	tiles_block = layer_tilemap_get_id("Tiles_block");
	tiles_ground = undefined;
}
else
{
	tiles_block = undefined;
	tiles_ground = layer_tilemap_get_id("Tiles_ground");
}

if (instance_exists(obj_player))
{
	last_saving_point_x = obj_player.x;
	last_saving_point_y = obj_player.y;
}