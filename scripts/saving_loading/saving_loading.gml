function saving_room()
{
	var _energon_num = instance_number(obj_energon);
	var _enemy_num = instance_number(obj_enemy_flying_random);
	var _last_x = obj_game.last_saving_point_x;
	var _last_y = obj_game.last_saving_point_y;
	
	if (instance_exists(obj_player))
	{
		_last_x = obj_player.x;
		_last_y = obj_player.y;
	}
	
	var _room_struct = {
		save_x : _last_x,
		save_y : _last_y,
		energon_num : _energon_num,
		energon_data : array_create(_energon_num),
		enemy_num : _enemy_num,
		enemy_data : array_create(_enemy_num)
	}
	
	for (var _i = 0 ; _i < _energon_num ; _i++)
	{
		var _inst = instance_find(obj_energon, _i);
		_room_struct.energon_data[_i] = {
			x : _inst.x,
			y : _inst.y
		}
	}
	
	for (var _i = 0 ; _i < _enemy_num ; _i++)
	{
		var _inst = instance_find(obj_enemy_flying_random, _i);
		_room_struct.enemy_data[_i] = {
			x : _inst.x,
			y : _inst.y,
			image : _inst.image_index
		}
	}
	
	if (room == rm_1) global.room_data.rm_1 = _room_struct;	
	if (room == rm_2) global.room_data.rm_2 = _room_struct;
	if (room == rm_3) global.room_data.rm_3 = _room_struct;	
	if (room == rm_4) global.room_data.rm_4 = _room_struct;	
	if (room == rm_5) global.room_data.rm_5 = _room_struct;
}


function loading_room()
{
	var _room_struct = 0;
	
	if (room == rm_1) _room_struct = global.room_data.rm_1;	
	if (room == rm_2) _room_struct = global.room_data.rm_2;
	if (room == rm_3) _room_struct = global.room_data.rm_3;	
	if (room == rm_4) _room_struct = global.room_data.rm_4;	
	if (room == rm_5) _room_struct = global.room_data.rm_5;
	
	if (!is_struct(_room_struct)) exit;
	
	if (instance_exists(obj_energon)) instance_destroy(obj_energon);	
	if (instance_exists(obj_enemy_flying_random)) instance_destroy(obj_enemy_flying_random);

	for (var _i = 0 ; _i < _room_struct.energon_num ; _i++)
	{
		var _inst = instance_create_layer(_room_struct.energon_data[_i].x, 
			_room_struct.energon_data[_i].y, "Instances", obj_energon);
	}
	
	for (var _i = 0 ; _i < _room_struct.enemy_num ; _i++)
	{
		var _inst = instance_create_layer(_room_struct.enemy_data[_i].x, 
			_room_struct.enemy_data[_i].y, "Instances", obj_enemy_flying_random);
		_inst.image_index = _room_struct.enemy_data[_i].image;
	}
	
	if (instance_exists(obj_player)) instance_destroy(obj_player);	
	if (instance_exists(obj_follower)) instance_destroy(obj_follower);
	
	instance_create_layer(_room_struct.save_x, _room_struct.save_y,
		"Instances", obj_follower);
	instance_create_layer(_room_struct.save_x, _room_struct.save_y,
		"Instances", obj_player);

}


function saving_game()
{
	var _save_array = array_create(0);
	
	saving_room();
	
	var _last_x = obj_game.last_saving_point_x;
	var _last_y = obj_game.last_saving_point_y;
	
	if (instance_exists(obj_player))
	{
		_last_x = obj_player.x;
		_last_y = obj_player.y;
	}
	
	global.stat_data.save_x = _last_x;	
	global.stat_data.save_y = _last_y;
	global.stat_data.save_room = room_get_name(room);
	
	global.stat_data.energon_num = global.energon_num;
	
	array_push(_save_array, global.stat_data);
	array_push(_save_array, global.room_data);
	
	var _file = "savedata.sav";
	var _json = json_stringify(_save_array);
	var _buf = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buf, buffer_string, _json);
	buffer_save(_buf, _file);
	buffer_delete(_buf);
}


function loading_game()
{
	var _file = "savedata.sav";
	if (!file_exists(_file))
	{
		room_goto(rm_1);
		instance_create_layer(10, 10,
			"Instances", obj_follower);
		instance_create_layer(10, 10,
			"Instances", obj_player);
		exit;
	}
	
	var _buf = buffer_load(_file);
	var _json = buffer_read(_buf, buffer_string);
	buffer_delete(_buf);
	
	var _load_array = json_parse(_json);
	
	global.stat_data = array_get(_load_array, 0);
	global.room_data = array_get(_load_array, 1);
	
	global.energon_num = global.stat_data.energon_num;
	
	var _load_room = asset_get_index(global.stat_data.save_room);
	room_goto(_load_room);
	
	if (instance_exists(obj_player))
	{
		instance_destroy(obj_player);
	}
	
	instance_create_layer(global.stat_data.save_x, global.stat_data.save_y,
		"Instances", obj_follower);
	instance_create_layer(global.stat_data.save_x, global.stat_data.save_y,
		"Instances", obj_player);
		
	loading_room();
}


