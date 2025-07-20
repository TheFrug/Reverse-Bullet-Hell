//resources
gold = 0;
xp = 0;

//Inventory
weapons = {};


weaponDictionary = {
	magicMissile: {
		level: 1,
		damage: 10,
		amount: 1,
		cooldown: 60, // in frames (1 second at 60fps)
		pierce: 0,
		lastFired: -999, // timestamp of last shot
	},
	swordSwing: { //TODO
        level: 1,
        damage: 20,
        projectileCount: 1,
        cooldown: 90,
        pierce: 100,
        lastFired: -999
    }
};

//Manage alarm timer w/ loop
alarmTime = 20;
alarm[0] = alarmTime;