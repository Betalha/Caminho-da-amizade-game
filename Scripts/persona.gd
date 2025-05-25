extends CharacterBody2D

@export var speed: float = 200.0
@onready var ui_layer = get_tree().get_current_scene() # ou outro node onde o balão deve ser adicionado
var dialogo_scene = preload("res://Cenas/dialogo.tscn")
var dialogo_instance : Control = null
var timer: Timer = null
func _ready():
	timer = Timer.new()
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))  # <-- CORRETO
	add_child(timer)

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed

	# Move e depois checa colisões
	move_and_slide()

	# Verifica colisões com NPCs
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.is_in_group("npc"):
			pass
		if collider and collider.is_in_group("colisor"):
			get_tree().change_scene_to_file("res://Cenas/Patio.tscn")
		if collider and collider.is_in_group("children1"):
			get_tree().change_scene_to_file("res://Cenas/freeway.tscn")
		if collider and collider.is_in_group("End_game"):
			get_tree().change_scene_to_file("res://Cenas/tela_final.tscn")
		if collider and collider.is_in_group("joao_game"):
			get_tree().change_scene_to_file("res://Cenas/nv_ninja.tscn")
