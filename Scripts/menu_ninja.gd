extends MarginContainer

@onready var comecar: Button = $VBoxContainer/Comecar
@onready var play: AudioStreamPlayer2D = $VBoxContainer/play


func _ready():
	comecar.pressed.connect(on_start_pressed)

func on_start_pressed():
	play.play()
	await play.finished
	get_tree().call_deferred("change_scene_to_file","res://Cenas/nv_ninja.tscn")
