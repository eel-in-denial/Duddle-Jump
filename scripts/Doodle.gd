extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -750.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var initialJump = true
var type = "character"
var last_collision

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
	if initialJump:
		velocity.y = JUMP_VELOCITY
		initialJump = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

	move_and_slide()
	if get_last_slide_collision():
		last_collision = get_slide_collision(0).get_collider()
		if last_collision.type == "breakable" and velocity.y < 700:
			last_collision.queue_free()
