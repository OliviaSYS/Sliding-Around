extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -700.0
var JUMP_COUNT = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT = 1
	elif Input.is_action_just_pressed("jump") and JUMP_COUNT < 2:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT += 1
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		# change SPEED to 7 to slide
		velocity.x = move_toward(velocity.x, 0, 85)

	move_and_slide()


func _on_fall_zone_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.
