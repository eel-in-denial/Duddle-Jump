extends StaticBody2D

var type
var sprite
var normal_texture = preload("res://sprites/mc.jpg")
var breakable_texture = preload("res://sprites/un-patriot.jpg")
# Called when the node enters the scene tree for the first time.

func initialise(x, y):
	sprite = $Sprite2D
	var plat_type = ["normal", "normal", "normal", "normal", "normal", "normal", "normal", "breakable", "breakable", "breakable"]
	self.position = Vector2(x, y)
	type = plat_type[Global.random.randi_range(0, 9)]
	if type == "normal":
		sprite.set_texture(normal_texture)
	elif type == "breakable":
		sprite.set_texture(breakable_texture)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if type == "breakable" and body.type == "character":
		self.queue_free()
