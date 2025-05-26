extends MarginContainer

@onready var sair: Button = $VBoxContainer/Sair
@onready var saida: AudioStreamPlayer2D = $saida


func _ready():
	sair.pressed.connect(on_exit_pressed)

func on_exit_pressed():
	saida.play()
	await saida.finished
	get_tree().quit()
