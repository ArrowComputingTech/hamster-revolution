extends Control

@export var video_player: VideoStreamPlayer

func _ready() -> void:
	video_player.play()
	video_player.finished.connect(_on_video_finished)

func _on_video_finished() -> void:
	# Hide the video so the black background shows for 1 second,
	# then start the game.
	video_player.hide()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
