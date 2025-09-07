shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	float grayscale = dot(color.rgb, vec3(0.15, 0.387, 0.0));
	COLOR = vec4(grayscale, grayscale, grayscale, color.a);
}