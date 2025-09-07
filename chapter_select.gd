extends Control

func ready_for_load() -> void:
	$ChapterSelect.load_chapters()
	$ColorRect.material = preload("res://uiElements/chapter_selectbg.tres")

func load_chapter(chapter_num: int):
	if Engine.is_editor_hint():
		return
		#ProjectSettings.globalize_path(str("res://../",$ChapterSelect.chapters[chapter_num].exe_location))
	else:
		var exe_path = str("../",$ChapterSelect.chapters[chapter_num].exe_location)
		
		if not FileAccess.file_exists(exe_path):
			$AnimationPlayer.play("failed")
			return
		OS.create_process(exe_path, [])
	
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_exit_button_pressed() -> void:
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
