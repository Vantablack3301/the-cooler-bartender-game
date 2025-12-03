// don't play novice mode if its not unlocked
if !global.expertBeaten
	return

// Inherit the parent event
event_inherited();

global.gameDifficulty = "endless"
room_goto(BarFront);