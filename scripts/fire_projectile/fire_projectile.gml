// TODO

var weaponName = argument0;
var xPosition = argument1;
var yPosition = argument2;
var target = argument3;
var weaponStats = argument4;

var dir = point_direction(xPosition, yPosition, target.x, target.y);

var p = instance_create_layer(xPosition, yPosition, "projectiles", obj_projectile);

p.direction = dir;
p.speed = weaponStats.projectileSpeed ?? 6;
p.damage = weaponStats.damage;
p.pierce = weaponStats.pierce;
p.target = target;