function check_collision_block(_move_x, _move_y)
{
	/*if (place_meeting(x + _move_x, y + _move_y, obj_interact_parent))
	{
		// If there was an object collision, return true, and end the function
		return true;
	}*/

	// The function continues if there were no object collisions. In this case we check for tile
	// collisions, at each corner of the instance's bounding box.
	// This checks for tile collision at the top-left corner of the instance's mask
	var _left_top = tilemap_get_at_pixel(obj_game.tiles_block, bbox_left + _move_x, bbox_top + _move_y);

	// This checks for tile collision at the top-right corner of the instance's mask
	var _right_top = tilemap_get_at_pixel(obj_game.tiles_block, bbox_right + _move_x, bbox_top + _move_y);

	// This checks for tile collision at the bottom-right corner of the instance's mask
	var _right_bottom = tilemap_get_at_pixel(obj_game.tiles_block, bbox_right + _move_x, bbox_bottom + _move_y);

	// This checks for tile collision at the bottom-left corner of the instance's mask
	var _left_bottom = tilemap_get_at_pixel(obj_game.tiles_block, bbox_left + _move_x, bbox_bottom + _move_y);

	// The results of the above four actions were stored in temporary variables. If any of those variables were true, meaning a tile
	// collision was found at any given corner, we return true and end the function.
	if (_left_top or _right_top or _right_bottom or _left_bottom)
	{
		return true;
	}

	// If no tile collisions were found, the function continues.
	// In that case we return false, to indicate that no collisions were found, and the instance is free to move to the new position.
	return false;
}