extends Node2D

@onready var player = $Player
@onready var control = $HUD/Control
@onready var game_over = $game_over

signal morreu

func _ready():
	player.morri.connect(_resetGame)
	control.timer_zerado.connect(_resetGame)

func _resetGame():
	emit_signal("morreu")
	Global.somaPontos = 0
	Global.Life = 3
