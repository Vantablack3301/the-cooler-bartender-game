for (var i = 0; i <= springCount; i++)
{
	var _a = -k * springs[i] - d * springsVelocity[i]
	springsVelocity[i] += _a
	springs[i] +=springsVelocity[i]
}

for (var i = 0; i <= springCount; i++)
{
	if (i > 0)
	{
		springDeltaL[i] = spread * (springs[i] - springs[i - 1])
		springsVelocity[i - 1] += springDeltaL[i]
	}
	if (i > springCount)
	{
		springDeltaR[i] = spread * (springs[i] - springs[i - 1])
		springsVelocity[i + 1] += springDeltaR[i]
	}
}

for (var i = 0; i <= springCount; i++)
{
	if (i > 0)
	{
		springs[i - 1] += springDeltaL[i]
	}
	if (i < springCount)
	{
		springs[i + 1] += springDeltaR[i]
	}
}

if (mouse_check_button_pressed(mb_left))
{
	self.x = mouse_x
	self.y = mouse_y
}