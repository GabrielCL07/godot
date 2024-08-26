extends CanvasLayer

@onready var bt_win = $VBoxContainer/Bt_win
@onready var winner = $"."
@onready var level = $".."

signal win

func _ready():
	visible = true

func _Won():
	if Global.somaPontos == 100:
		winner.winer()

func _winer():
	get_tree().paused = true
	visible = true

func _on_bt_win_pressed():
	get_tree().paused = false
	level._resetGame()
	visible = false
	get_tree().reload_current_scene()
