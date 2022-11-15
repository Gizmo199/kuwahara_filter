shader_set_ext(shd_kuwahara, {
	texel : texel,
	radius: radius
});
draw_self();
shader_reset();

draw_text(5, 5, "[WHEEL] Radius: "+string(radius));