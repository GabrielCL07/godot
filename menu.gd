extends CanvasLayer


func _ready():
	get_tree().paused = true


func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().paused = false
	visible = false
