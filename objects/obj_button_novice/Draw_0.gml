// don't play novice mode if its not unlocked
if !global.newBeaten {
	return
}

// Inherit the parent event
event_inherited();