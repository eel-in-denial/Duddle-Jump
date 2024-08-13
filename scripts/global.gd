extends Node
var random = RandomNumberGenerator.new()

var screen_width = 1920
var screen_height = 1080

var gravity = 2000
var previous_scene

#progress
var achievements = false

# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
