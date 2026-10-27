extends StaticBody2D

@export var circle: Polygon2D
@export var sprite: Sprite2D
@export var collider: Area2D

func _ready() -> void:
	sprite.hide()
	circle.show()
	collider.monitoring = true

func fall_over() -> void:
	collider.disabled = true
	set_process(false)
	sprite.show()
	circle.hide()

func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit: " + body.name)
	circle.hide()
	sprite.show()
