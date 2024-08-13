extends StaticBody2D

var type
var sprite
var normal_texture = preload("res://sprites/normal_plat.png")
var breakable_texture = preload("res://sprites/breaking_plat.png")
var crumbling_texture = preload("res://sprites/crumbling_plat.png")
var moving_texture = preload("res://sprites/moving_plat.png")
var ver_moving_texture = preload("res://sprites/vert_moving_plat.png")
var switching = preload("res://sprites/switching_plat.png")
var break_state = false
var collision
var direction = 3
# Called when the node enters the scene tree for the first time.

func initialise(x, y):
	sprite = $Sprite2D
	var plat_type = ["normal", "normal", "normal", "normal", "normal", "breakable", "crumbling", "moving", "ver_moving", "switching"]
	self.position = Vector2(x, y)
	type = plat_type[Global.random.randi_range(0, 9)]
	if type == "normal":
		sprite.set_texture(normal_texture)
	elif type == "breakable":
		sprite.set_texture(breakable_texture)
	elif type == "crumbling":
		sprite.set_texture(crumbling_texture)
		collision = $collision
		collision.disabled = true
	elif type == "moving":
		sprite.set_texture(moving_texture)
	#elif type == "ver_moving":
		#sprite.set_texture(ver_moving_texture)
	#elif type == "switching":
		#sprite.set_texture(switching)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if type == "moving":
		position.x += direction
		if position.x > 1250:
			direction = -3
		if position.x < 660:
			direction = 3
		


func _on_area_2d_body_entered(body):
	if type == "crumbling" and body.velocity.y > 0:
		queue_free()


#func _on_area_2d_mouse_entered():
	#print(position.x)


func _on_spring_body_entered(body):
	if body.type == "character" and body.velocity.y >= -100:
		body.velocity.y = body.JUMP_VELOCITY*1.5
