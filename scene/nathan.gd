extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var CROUCH = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	print(velocity.x)
	if velocity.x > 0:
		print("in")
		$AnimationPlayer.play("walking")
	elif CROUCH == true:
		$AnimationPlayer.play("crouch")
	else:
		$AnimationPlayer.play("idle")
	velocity.y += gravity * delta
	var direction = Input.get_axis("left", "right")
	move_and_slide()

func nathan():
	pass

