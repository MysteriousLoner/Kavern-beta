extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	print(velocity.x)
	if velocity.x > 0:
		print("in")
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("idle")
	velocity.y += gravity * delta
	var direction = Input.get_axis("left", "right")
	if direction > 0:
		$KyleHelmetSpritesheet.flip_h = false
	elif direction < 0:
		$KyleHelmetSpritesheet.flip_h = true
	move_and_slide()

func kyle():
	pass
