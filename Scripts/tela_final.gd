extends MarginContainer

@onready var sair: Button = $VBoxContainer/Sair


func _ready():
	sair.pressed.connect(on_exit_pressed)

func on_exit_pressed():
	get_tree().quit()
