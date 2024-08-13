extends Node2D

var platform_scene = preload("res://scenes/platform.tscn")
var camera
var doodle
var score
var platform_container
var plat_per_screen = 40
var plat_chance = 0.9
var platform_instance
var plat_generate_thresh= 0
var visible_plat_thresh = Global.screen_height
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = $Camera
	doodle = $Doodle
	platform_container = $Platforms
	score = $Control/Label
	create_platforms()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if doodle.position.y < camera.position.y:
		camera.position.y = doodle.position.y
		visible_plat_thresh = camera.position.y + Global.screen_height/2
		score.text = str(int(40-doodle.position.y/5))
		for p in platform_container.get_children():
			if p.position.y >= visible_plat_thresh:
				p.queue_free()
	if doodle.position.y <= plat_generate_thresh:
		plat_generate_thresh -= Global.screen_height*2
		plat_chance -= 0.01
		create_platforms()

func create_platforms():
	for i in range(plat_per_screen):
		if (Global.random.randf()) <= plat_chance:
			platform_instance = platform_scene.instantiate()
			platform_instance.initialise(Global.random.randf_range(610, Global.screen_width-610), plat_generate_thresh+Global.screen_height - i*Global.screen_height/20)
			platform_container.add_child(platform_instance)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

