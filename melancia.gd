extends Area2D

func _on_body_entered(body):
	if body.name== "Player":
		Global.somaPontos += 5
		print(Global.somaPontos)
		$anim_item.play("coletado")
		await $anim_item.animation_finished
		queue_free()#tirar de cena
