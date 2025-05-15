extends Enemy

@export var speed: float = -250.0
@export var direction: Vector2 = Vector2.RIGHT
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func setup(dir: Vector2, spd: float) -> void:
	direction = dir
	speed = spd
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.flip_h = (dir == Vector2.RIGHT)

func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://Cenas/freeway.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Cenas/freeway.tscn")
