extends Node2D

@onready var cover_image: MeshInstance2D = $CoverImage
@onready var frame: Sprite2D = $Frame

@onready var title: Label = $Title
@onready var chapter: Label = $Chapter

const CHAPTER_GRAYSCALE = preload("uid://d1gl7iioslbqk")

var orig_scale: Vector2

func _on_button_pressed() -> void:
	$Press.play()
	get_parent().get_parent().load_chapter(int(name))

func _on_button_mouse_entered() -> void:
	orig_scale = frame.scale
	frame.scale = frame.scale*1.04
	cover_image.scale = cover_image.scale*1.04
	cover_image.material = null
	$Hover.play()
func _on_button_mouse_exited() -> void:
	frame.scale = orig_scale
	cover_image.scale = orig_scale
	cover_image.material = CHAPTER_GRAYSCALE
