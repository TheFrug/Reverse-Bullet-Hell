
// Check collisions between rectangle and all instances of obj_enemy_parent
// Add matches to _list, using collision_rectangle_list() to return _num, the number of enemies found
var _list = ds_list_create();
var _num = collision_rectangle_list(
bbox_left,
bbox_top,
bbox_right,
bbox_bottom,
obj_enemy_parent,
false,
true,
_list,
false);

if _num > 0 // Continue only if enemy found
{
	for (var i = 0; i < _num; ++i)
	{
		_list[| i].hitPoints -= damage; // Access the i-th instance in list and reduce hitPoints by damage
		if (_list[| i].hitPoints <= 0){
			instance_destroy(_list[| i]); // Destroy instance
		}
	}
}
ds_list_destroy(_list); // Frees memory used by _list to avoid memory leak