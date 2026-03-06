extends CanvasLayer


func _input(event: InputEvent) -> void:
	if event.is_action("restart"):
		get_node("/root/Game")._on_restart_button_pressed()
