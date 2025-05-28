extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_sing: Area2D = $area_sing

const lines: Array[String] = [
	"Olá Carlos",
	"Seja bem vindo a nova escola, sei que pode ser dicifil se enturmar com pessoas novas"
	,"Mas tente conversar com elas hoje, vamos para o patio do colegio agora, pode se dirigir para fora da sala"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		var bodies = area_sing.get_overlapping_bodies()
		for body in bodies:
			if body.is_in_group("player") and !DialogManeger.is_message_active:
				texture.hide()
				DialogManeger.start_message(global_position, lines)
				return
		# Fora da área ou já tem diálogo ativo
		texture.hide()
