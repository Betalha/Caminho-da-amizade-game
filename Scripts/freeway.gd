extends Node

var star_scene = preload("res://Cenas/mostros.tscn")
var star_spawn_y = [200, 300, 400, 500]
var star_spawn_x = [250, 350, 450, 550]

func _ready() -> void:
	$TimerMonstro.start()
	$AudioStreamPlayer.play()

func _on_timer_monstro_timeout() -> void:
	var star = star_scene.instantiate()

	var spawn_y = star_spawn_y[randi_range(0, star_spawn_y.size() - 1)]
	var spawn_x = star_spawn_x[randi_range(0, star_spawn_x.size() - 1)]
	var viewport = get_viewport().get_visible_rect()

	# Sortear lado (true = direita, false = esquerda)
	var spawn_from_right = randi() % 2 == 0

	var dir: Vector2
	var pos: Vector2

	if spawn_from_right:
		dir = Vector2.LEFT
		pos = Vector2(viewport.size.x + 100, spawn_y)
	else:
		dir = Vector2.RIGHT
		pos = Vector2(-100, spawn_x)

	# Chama o setup antes de adicionar à árvore
	star.setup(dir, 250.0)
	star.position = pos
	add_child(star)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	$AudioStreamPlayer.play()
