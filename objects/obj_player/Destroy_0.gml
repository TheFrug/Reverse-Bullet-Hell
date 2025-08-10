/// @description For Later with GPTs help

/*
Okay, so here's what you can do to get the weapons to hit once and only again on a timer and have them create their own timers on enemies. Almost like Vampire Survivors. (This system can be refined further to allocate more weapons by using time_source but I'll figure that out later).

On your obj_Player -> (Create): make an array like this; and a hit delay variable for each weapon:

dmg_type[0] = "<Weapon1>"

dmg_type[1] = "<Weapon2>";

dmg_type[2] = "<Weapon3>"

hitd_weapon1 = 20

hitd_weapon2 = 40

hitd_weapon3 = 60

Then we add those to our obj_Weapon_Parent-> (Create) and in each weapon that inherits the parent, by calling them from the player like such: 

dmg_type = obj_Player.dmg_type[0]  // the number in the [ ] determines the type set previously

hitstun_delay = obj_Player.hitd_weapon1

We do this for each weapon just like we set the dmg = . 
Now for the collision. On the obj_Enemy_Parent-> (Create) we make a can_collide = true for each weapon (we will set this to false in the collision and true again after the alarm ends):


can_collide_wp1 = true;

can_collide_wp2 = true;

can_collide_wp3 = true;

Next go to the step event of the obj_Weapon_Parent and comment the part in the code that says " //if (_list[| i].sprite_index == _list[| i].spr){ " we won't need that cause we will use can_collide. Now type this for each weapon:

if (_list[| i].can_collide_wp1 = true){

			if dmg_type = "wp1"{

				_list[| i].can_collide_wp1 = false

				_list[| i].sprite_index = _list[| i].sprW;

				obj_Controller.alarm[1] = hitstun_delay

				_list[| i].hp -= dmg

				// push

				var dir = point_direction(x,y, _list[| i].x,_list[| i].y)

				_list[| i].x = _list[| i].x + lengthdir_x(20, dir);

				_list[| i].y = _list[| i].y + lengthdir_y(20, dir);}
}
Repeat that for each weapon changing the variables (we repeat the push cause we want a different push for each one) and we keep the destroy list and the instance_destroy at the end of the code. We're almost done now. Go to your obj_Controller and create an Alarm 1, 2 and 3 (one for each weapon) and insert the code:

with(obj_Enemy_Parent){



	can_collide_wp1 = true;

	

}

This resets the hitstun bool and allows the weapon to hit the enemy again!!! We keep the flashing to white effect on alarm 0 cause the flash is not based on hitstun in VS and always has a set duration. Aaaand we're done. This can def be cleaned up and perfected by relying on time_source and if you want to keep the alarms you can get over the alarm limit by setting the obj_Player -> switch(slot[0]){ code in the alarm to get the hitstun of only the weapon that was equipped there which will let you only have 6 alarms in the obj_Controller counting down but for an infinite number of possible weapons. Thanks for reading! If I missed something and you can't get this working just reply to me! Thanks again for the vids 1upIndie!



*/