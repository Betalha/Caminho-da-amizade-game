extends Node

@onready var start: Button = $Panel/VBoxContainer/Start
@onready var exit: Button = $Panel/VBoxContainer/Exit

func _ready():
	var theme = Theme.new()
	var button_style = StyleBoxFlat.new()
	button_style.bg_color = Color("#ffcb05")
	theme.set_stylebox("normal", "Button", button_style)
	theme.set_stylebox("hover", "Button", button_style)
	theme.set_stylebox("pressed", "Button", button_style)
	start.pressed.connect(on_start_pressed)
	exit.pressed.connect(on_exit_pressed)

func on_start_pressed():
	get_tree().change_scene_to_file("res://Cenas/main.tscn")

func on_exit_pressed():
	get_tree().quit()
