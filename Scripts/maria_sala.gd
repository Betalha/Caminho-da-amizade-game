extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var dialogo_maria_sala: Sprite2D = $Dialogo_Maria_sala

const lines: Array[String] = [
	"Oi!",
	"Sou a Maria!"
]

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		var bodies = area_2d.get_overlapping_bodies()
		for body in bodies:
			if body.is_in_group("player") and !DialogManeger.is_message_active:
				dialogo_maria_sala.hide()
				DialogManeger.start_message(global_position, lines)
				return
		# Fora da área ou já tem diálogo ativo
		dialogo_maria_sala.hide()
