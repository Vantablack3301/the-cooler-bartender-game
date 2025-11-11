image_alpha = 0.5
transparencyBufferHeight = 32
springCount = ceil(sprite_width/WATERDIVISION)
springs[springCount] = 0
springsVelocity[springCount] = 0
springDeltaL[springCount] = 0
springDeltaR[springCount] = 0
k = 0.035
d = 0.025   //broooooo, my K/D, youre gonna ruin my KD
spread = 0.25

if (shader_is_compiled(liquidWaves)) {
    global.u_pixelH     = shader_get_uniform(liquidWaves, "pixelH")
    global.u_pixelW     = shader_get_uniform(liquidWaves, "pixelW")
    global.u_springs    = shader_get_uniform(liquidWaves, "springs")
    global.u_time       = shader_get_uniform(liquidWaves, "time")
    global.u_fizzle     = shader_get_uniform(liquidWaves, "fizzle")
    global.u_springCount = shader_get_uniform(liquidWaves, "springCount")
}