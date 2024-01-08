///@desctription print_log
///@arg argument

function print()
{
	var _final_text = "";
	for (var _i = 0 ; _i < argument_count ; _i++)
	{
		_final_text += (string(argument[_i]) + " ");
	}
	show_debug_message(_final_text);
}