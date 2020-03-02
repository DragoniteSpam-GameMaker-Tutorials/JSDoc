/// @desc Add a point (position, normal, texture, color) to a vertex buffer
/// @param vbuffer The vertex buffer to add the data to
/// @param x The x coordinate of the vertex
/// @param y The y coordinate of the vertex
/// @param z The z coordinate of the vertex
/// @param nx The x component of the normal vector
/// @param ny The y component of the normal vector
/// @param nz The z component of the normal vector
/// @param xtex The x coordinate of the texture UV
/// @param ytex The y coordinate of the texture UV
/// @param color The color to blend the vertex with
/// @param alpha The alpha (transparency) of the vertex
/// @return N/A

var vbuffer = argument0;
var xx = argument1;
var yy = argument2;
var zz = argument3;
var nx = argument4;
var ny = argument5;
var nz = argument6;
var xtex = argument7;
var ytex = argument8;
var color = argument9;
var alpha = argument10;

vertex_position_3d(vbuffer, xx, yy, zz);
vertex_normal(vbuffer, nx, ny, nz);
vertex_texcoord(vbuffer, xtex, ytex);
vertex_color(vbuffer, color, alpha);