/// @description shot

var _bullet = instance_create_layer(x, y, "Instances", obj_bullet_1);
_bullet.creator = self;
_bullet.faction = faction;

_bullet.direction = irandom_range(250, 300);

alarm[0] = shot_speed;