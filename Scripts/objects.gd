extends StaticBody2D

signal knocked_over

@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D
@export var broken_texture: Texture2D
var fallen: bool = false

const PARTICLE_SCENE = preload("res://Scenes/Particle_objectfall.tscn")

func _ready() -> void:
	sprite.show()

func fall_over() -> void:
	if fallen:
		return
	fallen = true
	sound.play()
	set_process(false)
	if broken_texture:
		sprite.texture = broken_texture
	else:
		sprite.hide()
	_spawn_particles()  
	knocked_over.emit()

# NEW: spawns the particle scene at this object's position
func _spawn_particles() -> void:
	var effect = PARTICLE_SCENE.instantiate()
	get_parent().add_child(effect)
	effect.global_position = global_position
	effect.emitting = true
	effect.finished.connect(effect.queue_free)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: " + body.name)
	if body.name == "Player": # check player is the body
		if fallen:
			return
		fall_over()
