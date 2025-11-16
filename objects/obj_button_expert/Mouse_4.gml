// don't play novice mode if its not unlocked
if !global.noviceBeaten
	return

// Inherit the parent event
event_inherited();

global.gameDifficulty = "expert"
room_goto(BarFront);