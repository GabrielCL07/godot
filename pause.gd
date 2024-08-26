extends CanvasLayer

@onready var level = $".."

var game_paused = false

func _ready():
	visible = false

func _on_but_quit_pressed():
	get_tree().quit()

func _on_but_resume_pressed():
	get_tree().paused = false
	visible = false

func _on_but_reset_pressed():
	get_tree().paused = false
	level._resetGame()
	get_tree().reload_current_scene()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused
