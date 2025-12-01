if obj_Manager.money > 10 && global.tutorialShopIndicator == false {
	part_particles_burst(part_sys, x, y, CoinParticle)
	global.tutorialShopIndicator = true
}