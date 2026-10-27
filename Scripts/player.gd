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
<<<<<<< HEAD
	
	#animation for character
	if Input.is_action_just_pressed("Left"):
		$CollisionShape2D/AnimatedSprite2D.play("left")
	if Input.is_action_just_pressed("Up"):
		$CollisionShape2D/AnimatedSprite2D.play("up")	
	if Input.is_action_just_pressed("Down"):
		$CollisionShape2D/AnimatedSprite2D.play("down")	
	if Input.is_action_just_pressed("Right"):
		$CollisionShape2D/AnimatedSprite2D.play("right")	
	
	if direction != Vector2.ZERO:
=======

	if direction != Vector2.ZERO && player_locked == false:
>>>>>>> b19619cfa81446f7b050e6518c8b97f1a89424b8
		# Accelerate ball to top speed
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
	else:
		# No input: ball keeps rolling, friction slows it over time
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
