extends CharacterBody2D

@export var speed: int #Top speed of the ball (px/s)
@export var acceleration: int #How fast the hamster gets the ball up to speed (px/s^2)
@export var friction: int #How fast the ball coasts to a stop with no input (px/s^2)
@export var player_locked: bool = false #Allows player to be locked after timer runs out

var screensize #Size of game window

func _ready() -> void:
	screensize = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")

	if direction != Vector2.ZERO && player_locked == false:
		# Accelerate ball to top speed
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
	else:
		# No input: ball keeps rolling, friction slows it over time
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
