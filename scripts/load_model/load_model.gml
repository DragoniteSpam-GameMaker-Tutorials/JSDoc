/// @desc Load a vertex buffer (model) from a Game Maker model file
/// @param filename The name of the file to load
/// @return The index of the vertex buffer created from the file

var file = argument0;

// mtl is ignored in this case, to keep things simple

var model = vertex_create_buffer();
vertex_begin(model, GameWorld.format);

var file = file_text_open_read(file);

var version = file_text_read_real(file);

if (version != 100){
	show_message("Wrong version of the model file!");
	vertex_delete_buffer(model);
	file_text_close(file);
	return -1;
}

var n = file_text_read_real(file);
file_text_readln(file);

var line;
line[10] = 0;

for (var i = 0; i < n; i++){
	for (var j = 0; j < 11; j++){
		line[j] = file_text_read_real(file);
	}
	var type = line[0];
	switch (type){
		case 0:
			// ignore this for now (primitive start)
			break;
		case 1:
			// ignore this for now (primitive end)
			break;
		case 2:	// vertex position
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			vertex_point_add(model, xx, yy, -zz, 0, 0, 0, 0, 0, c_white, 1);
			break;
		case 3:	// vertex position, color
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var color = line[4];
			var alpha = line[5];
			vertex_point_add(model, xx, yy, -zz, 0, 0, 0, 0, 0, color, alpha);
			break;
		case 4:	// vertex position, texture
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var xtex = line[4];
			var ytex = line[5];
			vertex_point_add(model, xx, yy, -zz, 0, 0, 0, xtex, ytex, c_white, 1);
			break;
		case 5:	// vertex position, texture, color
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var xtex = line[4];
			var ytex = line[5];
			var color = line[6];
			var alpha = line[7];
			vertex_point_add(model, xx, yy, -zz, 0, 0, 0, color, alpha, xtex, ytex);
			break;
		case 6:	// vertex position, normal
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var nx = line[4];
			var ny = line[5];
			var nz = line[6];
			vertex_point_add(model, xx, yy, -zz, nx, ny, -nz, c_white, 1, 0, 0);
			break;
		case 7:	// vertex position, normal, color
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var nx = line[4];
			var ny = line[5];
			var nz = line[6];
			var color = line[7];
			var alpha = line[8];
			vertex_point_add(model, xx, yy, -zz, nx, ny, -nz, color, alpha, 0, 0);
			break;
		case 8:	// vertex position, normal, texture
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var nx = line[4];
			var ny = line[5];
			var nz = line[6];
			var xtex = line[7];
			var ytex = line[8];
			vertex_point_add(model, xx, yy, -zz, nx, ny, -nz, xtex, ytex, c_white, 1);
			break;
		case 9:	// vertex position, normal, texture, color
			var xx = line[1];
			var yy = line[2];
			var zz = line[3];
			var nx = line[4];
			var ny = line[5];
			var nz = line[6];
			var xtex = line[7];
			var ytex = line[8];
			var color = line[9];
			var alpha = line[10];
			vertex_point_add(model, xx, yy, -zz, nx, ny, -nz, xtex, ytex, color, alpha);
			break;
		case 10: // block
			break;
		case 11: // cylinder
			break;
		case 12: // cone
			break;
		case 13: // ellipsoid
			break;
		case 14: // wall
			break;
		case 15: // floor
			break;
	}
}

file_text_close(file);
vertex_end(model);

return model;