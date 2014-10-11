varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

uniform sampler2D u_texture1;
uniform sampler2D u_texture2;//mask pic

void main()
{
	vec4 color = texture2D(u_texture1, v_texCoord);
	color.a = texture2D(u_texture2, v_texCoord).r;
	gl_FragColor = color;
}