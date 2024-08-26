extends Area2D

@onready var player = $"../../Player"

func _on_body_entered(body):
	if body.name== "Player":
		player._levouDano()
		Global.somaPontos -= 10
		print(Global.somaPontos)
		$anim_item.play("coletado1")
		await $anim_item.animation_finished
		queue_free()
