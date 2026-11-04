extends StaticBody2D

signal knocked_over

@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D

var fallen := false

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
	fall_over()
