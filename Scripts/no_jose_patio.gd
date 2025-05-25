extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D

const lines: Array[String] = [
	"Eai Carlos",
	"Cara to muito triste",
	"Briguei com meu primo e acabei quebrando o Video game dele.",
	"Queria me desculpar com ele mas estou sem coragem para fazer isso",
	"Voce poderia me dar um abraço, acho que isso vai me ajudar."
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		var bodies = area_2d.get_overlapping_bodies()
		for body in bodies:
			if body.is_in_group("Player_Patio") and !DialogManeger.is_message_active:
				sprite_2d.hide()
				DialogManeger.start_message(global_position, lines)
				return
		# Fora da área ou já tem diálogo ativo
		sprite_2d.hide()
