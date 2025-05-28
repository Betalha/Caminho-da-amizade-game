extends Node

var star_scene = preload("res://Cenas/shuriken.tscn")
var star_spawn = [150, 250, 350, 400,425,450,275,325]
var count_down = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$count_down.start()
	$shuriken_spawn_timer.start()
	$Ninja/Label.text = str(count_down)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shuriken_spawn_timer_timeout() -> void:
	var star = star_scene.instantiate()
	add_child(star)
	var spawn_y = star_spawn[randi_range(0, star_spawn.size() - 1)]
	star.position = Vector2(-1250, spawn_y)


func _on_ninja_foi_acertado() -> void:
	count_down = 30
	$Ninja/Label.text = str(count_down)
	$colisao_shrk.play()

func _on_count_down_timeout() -> void:
	count_down -= 1
	$Ninja/Label.text = str(count_down)
	if count_down < 1:
		get_tree().call_deferred("change_scene_to_file","res://Cenas/out_ninja.tscn")
