extends Enemy

@export var speed: float = 400.0
@export var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta
