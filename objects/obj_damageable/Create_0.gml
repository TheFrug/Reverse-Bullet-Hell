// Base stats
hp = 1;
maxHp = 1;
isDead = false;

self.take_damage = function(damageAmount) {
	hp -= damageAmount;
	if (hp <= 0 && !isDead) {
		isDead = true;
		self.die();
	}
};

self.die = function() {
	instance_destroy(); // Can override with additional function	
}