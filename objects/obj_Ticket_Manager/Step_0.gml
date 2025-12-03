upTime += delta_time / 1000000

if upTime >= 5 and room != LoseScreen
{
	dx = 3
	dy += 1
	x += dx
	y += dy
}

if room == LoseScreen
{
	x = 50
	y = 350
}
	

updatePos()