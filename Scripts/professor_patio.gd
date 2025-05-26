extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_sing: Area2D = $area_sing

const lines: Array[String] = [
	"Converse com o joao, ele esta na quadra",
	"Ele é sempre muito amigavel com todos, vai ser um otimo amigo",
	"Quando voce fizer amizades com o pessoal da turma, vamos voltar para a sala"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		var bodies = area_sing.get_overlapping_bodies()
		for body in bodies:
			if body.is_in_group("Player_Patio") and !DialogManeger.is_message_active:
				texture.hide()
				DialogManeger.start_message(global_position, lines)
				return
		# Fora da área ou já tem diálogo ativo
		texture.hide()
