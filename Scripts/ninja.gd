extends CharacterBody2D

@export var speed: float = 400.0
@export var jump_force: float = -900.0

@onready var ui_layer = get_tree().get_current_scene() # ou outro node onde o balão deve ser adicionado
var dialogo_scene = preload("res://Cenas/dialogo.tscn")
var dialogo_instance: Control = null
var timer: Timer = null
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	timer = Timer.new()
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	add_child(timer)
	set_physics_process(true)

func _physics_process(delta):
	# Aplica gravidade
	velocity.y += gravity * delta * 2

	# Movimento horizontal
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	# Move personagem e lida com colisões
	move_and_slide()

	# Verifica colisões com NPCs
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.is_in_group("npc"):
			print("Colidiu com NPC: ", collider.name)
			mostrar_fala("Olá, eu sou um NPC!")
			break # Evita mostrar múltiplas vezes se colidir com mais de um NPC

# Função que mostra o balão de fala
func mostrar_fala(texto: String):
	if dialogo_instance == null:
		dialogo_instance = dialogo_scene.instantiate()
		print("Balão de diálogo instanciado!")
		var npc = get_slide_collision(0).get_collider()
		if npc:
			npc.add_child(dialogo_instance)
	dialogo_instance.show()
	dialogo_instance.position = Vector2(0, -50)
	dialogo_instance.get_node("Label").text = texto
	timer.start()

func _on_timer_timeout():
	if dialogo_instance:
		dialogo_instance.hide()
