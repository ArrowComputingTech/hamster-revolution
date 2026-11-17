extends Node

@export var timer: Timer
@export var player: CharacterBody2D
@export var popup: Window
@export var timer_time: float
@export var a_finish: AudioStreamPlayer2D
@export var a_start: AudioStreamPlayer2D
@export var objects: Node2D
@export var ui: Window
<<<<<<< HEAD
@export var particles: GPUParticles2D
=======
@export var camera: Camera2D
>>>>>>> bbd64d55691eb0203ec0d76f8d3726232f1e4c69

var points: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(timer_time)
	popup.hide()
	popup.get_node("NewGameButton").pressed.connect(_on_new_game_button_pressed)
	popup.get_node("ExitButton").pressed.connect(_on_exit_button_pressed)
	for object in objects.get_children():
		object.knocked_over.connect(_on_object_knocked_over)
	a_start.play()

func _on_object_knocked_over() -> void:
	#particles.emitting = true
	points += 1
<<<<<<< HEAD
#	$GPUParticles2D.restart()
	particles.emitting = true
	
=======
	camera.violently_shake()
>>>>>>> bbd64d55691eb0203ec0d76f8d3726232f1e4c69

func _on_new_game_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_timer_timeout() -> void:
	player.velocity = Vector2(0, 0)
	player.player_locked = true
	popup.show()
	a_finish.play()
	ui.get_node("RichTextLabel").text = "Score: %d" % points
