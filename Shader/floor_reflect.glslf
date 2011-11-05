#version 120
#extension GL_ARB_texture_rectangle : require

uniform sampler2D Diffuse;
uniform sampler2DRect Reflection;
uniform sampler2D Noise;

varying vec3 position;
varying vec2 texcoord;

void main()
{
	vec3 tex_color = texture2D(Diffuse, texcoord).rgb;
	float x = length(position);
	float intensity = 1.0/(1.1+3.0*x*x) + 0.1;
	vec4 diffuse_color = vec4(tex_color*intensity, 1.0);
	vec4 reflect_color = texture2DRect(Reflection, gl_FragCoord.xy);
	float mix_fac = pow(texture2D(Noise, texcoord/5.0).g, 4);
	gl_FragColor = mix(diffuse_color, reflect_color, mix_fac);
}
