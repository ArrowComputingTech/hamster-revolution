extends StaticBody2D

@export var sprite: Sprite2D
@export var sound: AudioStreamPlayer2D

func _ready() -> void:
	sprite.show()

func fall_over() -> void:
	sound.play()
	set_process(false)
	sprite.hide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: " + body.name)
	fall_over()
