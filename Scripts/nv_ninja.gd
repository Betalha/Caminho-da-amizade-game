extends Node

var star_scene = preload("res://Cenas/shuriken.tscn")
var star_spawn = [150, 250, 350, 400,425,450,275,325]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$shuriken_spawn_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shuriken_spawn_timer_timeout() -> void:
	var star = star_scene.instantiate()
	add_child(star)
	var spawn_y = star_spawn[randi_range(0, star_spawn.size() - 1)]
	star.position = Vector2(900, spawn_y)
