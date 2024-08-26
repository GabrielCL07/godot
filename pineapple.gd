extends Area2D

func _on_body_entered(body):
	if body.name== "Player":
		Global.somaPontos += 15
		print(Global.somaPontos)
		$animacao.play("Coletavel")
		await $animacao.animation_finished
		queue_free()
