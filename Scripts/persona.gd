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
