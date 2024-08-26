extends CanvasLayer

@onready var player = $"../Player"
@onready var level = $".."

func _ready():
	visible = false
	player.morri.connect(_gameOver)

func _gameOver():
	get_tree().paused = true
	visible = true

func _on_button_pressed():
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()
