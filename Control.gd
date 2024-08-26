extends Control

@onready var contador = $MarginContainer/Pontos/contador
@onready var time = $MarginContainer/Timer/time
@onready var timer_1 = $Timer1
@onready var vidda = $MarginContainer/Vida/vidda

signal timer_zerado

var Min = 0
var Seg = 0

@export_range(0,1) var min_padrao = 1
@export_range(0,59) var seg_padrao = 30


func _ready():
	contador.text = str("Points: ","%02d" % Global.somaPontos)
	time.text = ("Time: ") + str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	Seg = seg_padrao
	Min = min_padrao
	vidda.text = str("Life Points: ",Global.Life)

func _process(delta):
	contador.text = str("Points: ","%02d" % Global.somaPontos)
	vidda.text = str("Life Points: ",Global.Life)
	if min_padrao == 0 && seg_padrao == 0:
		emit_signal("timer_zerado")

func _on_timer_1_timeout():
	if seg_padrao == 0:
		if min_padrao >0:
			min_padrao -=1
			seg_padrao = 59
		
	seg_padrao -= 1
	
	time.text = ("Time: ") + str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
