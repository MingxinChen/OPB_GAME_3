/// @description 

if (faction == FACTIONS.NETURAL)
{
	exit;
}
else if (faction == FACTIONS.ENEMY) 
{
	repeat (10){
		instance_create_layer(x,y,"Instances",obj_debris_enemy);
	}
}
else
{
	repeat (10){
		instance_create_layer(x,y,"Instances",obj_debris_autobots);
	}
}