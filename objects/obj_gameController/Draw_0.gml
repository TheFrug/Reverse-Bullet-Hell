// Optional: set draw color and font
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
// draw_set_font(fnt_ui); // Uncomment if you have a custom font

// Reference player (assumes single player)
var player = instance_find(obj_player, 0);

if (player != noone) {
    var uiX = 16;
    var uiY = 16;
    
    draw_text(uiX, uiY, "Gold: " + string(gold));
    draw_text(uiX, uiY + 20, "XP: " + string(xp));
    draw_text(uiX, uiY + 40, "Pickup Range: " + string(player.pickupRange));
	    // Debug: Show Magic Missile level (if owned)
    if (variable_struct_exists(weapons, "magicMissile")) {
        var mm = weapons.magicMissile;
        draw_text(uiX, uiY + 60, "Magic Missile Lv: " + string(mm.level));
    } else {
        draw_text(uiX, uiY + 60, "Magic Missile: Not Collected");
    }
}