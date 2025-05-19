extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_sing: Area2D = $area_sing

const lines: Array[String] = [
	"Teste testando",
	"passando dialogo"
]

func _unhandled_input(event):
	if area_sing.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManeger.is_message_active:
			texture.hide()
			DialogManeger.start_message(global_position, lines)
		else:
			texture.hide()
			
