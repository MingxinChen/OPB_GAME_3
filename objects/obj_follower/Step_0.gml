/// @description

if (lives <= 0) exit;

var _size = default_record;

if (room != rm_1 and obj_player.x == obj_player.xprevious and 
	obj_player.y == obj_player.yprevious)
{
	if (!check_collision_ground(0, 1))
	{
		_size = 0;
	}
}

if (ds_queue_size(obj_player.x_queue) > _size)
{
	var _xx = ds_queue_dequeue(obj_player.x_queue);
	var _yy = ds_queue_dequeue(obj_player.y_queue);
		
	x = _xx;
	y = _yy;
}
