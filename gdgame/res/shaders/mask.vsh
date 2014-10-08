attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 coord;

varying vec4 v_fragmentColor;
varying vec2 v_coord;

void main()
{
	gl_Position = CC_PMatrix *a_position;
	v_fragmentColor = a_color;
	v_coord = coord;
}