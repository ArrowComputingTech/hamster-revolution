extends StaticBody2D

@export var circle: Polygon2D
@export var sprite: Sprite2D
@export var collider: Area2D
@export var sound: AudioStreamPlayer2D

const PARTICLE_SCENE = preload("res://Scenes/Particle_objectfall.tscn")

func _ready() -> void:
	sprite.hide()
	circle.show()
	collider.monitoring = true

func fall_over() -> void:
	sound.play()
	#collider.monitoring = false
	set_process(false)
	sprite.show()
	circle.hide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: " + body.name)
	
	if body.name == "Player": #check player is the body
		var effect = PARTICLE_SCENE.instantiate()
		effect.global_position = global_position
		add_child(effect)
		queue_free()

	fall_over()
