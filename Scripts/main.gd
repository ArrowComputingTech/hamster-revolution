extends Node

@export var timer: Timer
@export var player: CharacterBody2D
@export var popup: Window
@export var dinosaur: StaticBody2D
@export var timer_time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = timer_time
	popup.hide()
	popup.get_node("NewGameButton").pressed.connect(_on_new_game_button_pressed)
	popup.get_node("ExitButton").pressed.connect(_on_exit_button_pressed)

func _on_new_game_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_timer_timeout() -> void:
	player.velocity = Vector2(0, 0)
	player.player_locked = true
	popup.show()
