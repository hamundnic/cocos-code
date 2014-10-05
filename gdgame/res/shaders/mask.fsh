varying vec4 v_fragmentColor;
varying vec2 v_coord;

uniform vec4 u_color;
uniform sampler2D u_texture1;
uniform sampler2D u_texture2;

void main()
{
	vec4 color1 = texture2D(u_texture1,v_coord);
	vec4 color2 = texture2D(u_texture2,v_coord);
	float a = (color2.r * 0.299 + color2.g * 0.587 + color2.b * 0.114);
	
	if (a != 1.0 && a != 0.0) {
		gl_FragColor = vec4(color1.r,color1.g,color1.b,a);
	}else{
		gl_FragColor = vec4(color1.r,color1.g,color1.b,a);
	}
}