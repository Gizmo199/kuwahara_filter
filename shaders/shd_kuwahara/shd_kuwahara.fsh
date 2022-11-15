// Kuwahara paper	http://www.umsl.edu/~kangh/Papers/kang-tpcg2010.pdf

varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform vec2	texel;
uniform float	radius;

void main()
{
	vec2 uv = v_vTexcoord;	
	mat4 mean	= mat4(0);
	mat4 stdv	= mat4(0);
	mat4 offs	= mat4(-radius, -radius, 0, 0, -radius, 0, 0, 0, 0, -radius, 0, 0, 0, 0, 0, 0);
	vec3 base	= vec3(1);
	vec2 pos	= vec2(uv);
	float n		= pow(radius + 1., 2.);
	float d		= 1.;
	float f		= 0.;
	vec3 col	= vec3(base);
	
	for ( int i=0; i<4; i++ ){
		for ( float j=0.; j<=radius; j+=1. ){
		for ( float k=0.; k<=radius; k+=1. ){
			
			pos = vec2(j, k) + offs[i].xy;
			
			vec2 uvpos = uv + (pos*texel);
			base = texture2D( gm_BaseTexture, uvpos).rgb;
			
			mean[i] += vec4(base, 1);
			stdv[i] += vec4(base * base, 1);
		}}	
		mean[i] /= n;
		stdv[i] = abs(stdv[i] / n - (mean[i]*mean[i]));
		f = (stdv[i].r + stdv[i].g + stdv[i].b);
		
		if ( f < d ){ 
			d	= f; 
			col= mean[i].rgb;
		}
	}
		
    gl_FragColor = vec4(col, 1);
}
