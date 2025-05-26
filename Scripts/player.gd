extends CharacterBody2D

@onready var player_sprite: Sprite2D = $Sprite2D
@onready var audio_colide: AudioStreamPlayer = $Audio_Colide  # Use AudioStreamPlayer (não 2D)
var posicao_inicial: Vector2 = Vector2(558, 608)

const PATIO = preload("res://Cenas/Patio.tscn")
const JOSE = preload("res://Cenas/jose.tscn")

@export var speed: float = 150.0

func _ready() -> void:
	position = posicao_inicial

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1

	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed

	move_and_slide()

	# Animações
	if velocity.y > 0:
		$Animacao.play("Baixo")
	elif velocity.y < 0:
		$Animacao.play("Cima")
	elif velocity.x > 0:
		player_sprite.flip_h = false
		$Animacao.play("Correndo")
	elif velocity.x < 0:
		player_sprite.flip_h = true
		$Animacao.play("Correndo")
	else:
		$Animacao.play("Parado")
	



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("monstro"):
		$Audio_Colide.play()
		await $Audio_Colide.finished
		position = posicao_inicial
		return
	elif body.is_in_group("npc"):
		get_tree().change_scene_to_file("res://Cenas/Patio.tscn")
