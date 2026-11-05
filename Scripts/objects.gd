extends StaticBody2D

@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D

const PARTICLE_SCENE = preload("res://Scenes/Particle_objectfall.tscn")

func _ready() -> void:
	sprite.hide()

func fall_over() -> void:
	sound.play()
	set_process(false)
	sprite.show()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: " + body.name)
	
	if body.name == "Player": #check player is the body
		var effect = PARTICLE_SCENE.instantiate()
		effect.global_position = global_position
		add_child(effect)
		queue_free()

	fall_over()
