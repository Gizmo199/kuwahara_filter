//////////////////////////////////////////  NOTE  ////////////////////////////////////////////////
//																								//
//		DELETE 'shd_kuwahara' IF YOU ARE USING HTML5. INSTEAD USE THE HTML5 SHADER AND DEFINE	//
//		RADIUS INSIDE THE SHADER. REPLACE 'shd_kuwahara' BELOW WITH 'shd_kuwahara_html			//
//																								//
//////////////////////////////////////////////////////////////////////////////////////////////////

shader_set_ext(shd_kuwahara, {
	texel : texel,
	radius: radius				// <<< Comment me out if using 'shd_kuwahara_html'
});
draw_self();
shader_reset();

draw_text(5, 5, "[WHEEL] Radius: "+string(radius));