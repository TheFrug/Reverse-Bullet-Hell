function add_weapon(weaponName){
	// Reference controller instance
	var controller = obj_game_controller;
	
	// Safety check: does weapon exist in weaponDictionary?
	if (variable_struct_exists(controller.weaponDictionary, weaponName)) {
		show_debug_message("Weapon '" + weaponName + "' not found in weaponInventory.");
		return;
	}
	
	// Check if player already has this weapon
	if (!variable_struct_exists(controller.weapons, weaponName)) {
		// Deep copy weapon from inventory
		controller.weapons[weaponName] = struct_copy(controller.weaponInventory[? weaponName]);
		show_debug_message("Added weapon: " + weaponName);
	} else {
		show_debug_message("Player already has weapon: " + weaponName + ". Leveling up!");	
	}
	
	level_up_weapon(weaponName);
}