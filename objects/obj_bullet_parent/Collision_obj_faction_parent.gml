/// @description 

if (other == creator) exit;

instance_destroy();

if (other.faction == faction) exit;

with(other)
{
	event_perform(ev_other, ev_user15);
}
