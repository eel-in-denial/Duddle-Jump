extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
func _on_quit_pressed():
	get_tree().quit()
	
func _on_settings_pressed():
	Global.previous_scene = self.scene_file_path
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_achievements_pressed():
	Global.previous_scene = self.scene_file_path
	get_tree().change_scene_to_file("res://scenes/achievements.tscn")
