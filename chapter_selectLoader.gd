extends Node2D

@export var chapters: Array[ChapterData]

const GRAYSCALE = preload("uid://d1gl7iioslbqk")
const CHAPTER_BUTTON = preload("uid://bxqd3hsrqghfe")

func load_chapters():
	var chapter_button_width: float = 228.0
	var chapters_seperation: float = 242.0
	var chapters_x_offset: float = 208.0
	var chapters_y_offset: float = 321.0
	var chapters_scale: float = 1.0
	
	var baseline_width = (chapter_button_width * 4) + (chapters_seperation * (4 - 1))
	
	var x_offset_x = chapters_x_offset/2.0 if chapters.size()>4 else chapters_x_offset
	
	if chapters.size()>4:
		
		var total_width = (chapter_button_width * chapters.size()) + (chapters_seperation * (chapters.size()-1))
		chapters_scale = baseline_width / total_width
		chapters_seperation *= chapters_scale
		total_width *= chapters_scale
		print(total_width)
	
		x_offset_x = (chapters_x_offset/2.75) + (baseline_width - total_width) / 2.0
	
	for i in chapters.size():
		var new_button = CHAPTER_BUTTON.instantiate()
		add_child(new_button)
		
		new_button.name = str(i)
		new_button.cover_image.texture = chapters[i].chapter_cover_image
		new_button.cover_image.material = GRAYSCALE
		new_button.title.text = str('"', chapters[i].chapter_title, '"')
		new_button.chapter.text = str("Chapter ", i+1)
		
		new_button.scale = Vector2(chapters_scale, chapters_scale)
		
		var scale_offset: float = (chapter_button_width * (1.0 - chapters_scale*2.0)) / 2.0
		
		if chapters.size() > 4: new_button.position = Vector2(
			x_offset_x+scale_offset+(chapter_button_width * chapters_scale + chapters_seperation * i), 
			chapters_y_offset)
		else:
			chapters_x_offset = 576-chapters.size()*(chapters_seperation/2.0)+(chapters_seperation/2.0)
			new_button.position = Vector2(chapters_x_offset+i*chapters_seperation, chapters_y_offset)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
