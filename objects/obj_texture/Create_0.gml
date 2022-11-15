x = room_width * .5;
y = room_height* .5;

var tex = sprite_get_texture(sprite_index, 0);
texel = [
	texture_get_texel_width(tex), 
	texture_get_texel_height(tex)
];

radius = 4;