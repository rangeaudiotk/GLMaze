#version 120

uniform sampler2D Diffuse;

varying vec3 position;
varying vec2 texcoord;

void main()
{
	vec3 tex_color = texture2D(Diffuse, texcoord).rgb;
	float x = length(position);
	float intensity = 1.0/(1.1+3.0*x*x) + 0.1;
	gl_FragColor = vec4(tex_color*intensity, 1.0);
}
