extends StaticBody2D

signal knocked_over

@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D

<<<<<<< HEAD
const PARTICLE_SCENE = preload("res://Scenes/Particle_objectfall.tscn")

func _ready() -> void:
	sprite.hide()
=======
var fallen := false
>>>>>>> e916be615ea8175de8a61f7558530300ce177fcb

func _ready() -> void:
	sprite.show()

func fall_over() -> void:
	if fallen:
		return
	fallen = true
	sound.play()
	set_process(false)
	sprite.hide()
	knocked_over.emit()

func _on_area_2d_body_entered(body: Node2D) -> void:
<<<<<<< HEAD
	print("hit: " + body.name)
	
	if body.name == "Player": #check player is the body
		var effect = PARTICLE_SCENE.instantiate()
		effect.global_position = global_position
		add_child(effect)
		queue_free()

=======
>>>>>>> e916be615ea8175de8a61f7558530300ce177fcb
	fall_over()
