extends MarginContainer

@onready var comecar: Button = $VBoxContainer/Comecar
@onready var sair: Button = $VBoxContainer/Sair


func _ready():
	comecar.pressed.connect(on_start_pressed)
	sair.pressed.connect(on_exit_pressed)

func on_start_pressed():
	get_tree().change_scene_to_file("res://Cenas/main.tscn")

func on_exit_pressed():
	get_tree().quit()
