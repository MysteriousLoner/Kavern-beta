extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var yeeting = false
var jump = false
var air_time = true
var timer_running = false
var timer2_running = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	global.ambient_light = true

func _physics_process(delta):
	if global.has_crystal == false:
		if global.ambient_light == true:
			$ambient.enabled = true
		$PointLight2D.enabled = false
		if global.freeze == true and global.flag1 == false:
			$AnimationPlayer.play("idle")
			return
		if is_on_ceiling() or is_on_floor():
			jump = false
			yeeting = false
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump") and is_on_floor() and global.jump_allowed == true:
			jump = true
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("jump") and is_on_ceiling() and global.jump_allowed == true:
			jump = true
			velocity.y = -JUMP_VELOCITY
		if Input.is_action_just_pressed("jump") and !is_on_floor() and !is_on_ceiling() and yeeting == false and jump == true and global.jump_allowed == true and global.switch_allowed == true:
				yeeting = true
				gravity = -gravity
				if gravity > 0:
					velocity.y = -JUMP_VELOCITY
				elif gravity < 0:
					velocity.y = JUMP_VELOCITY
				if $Player.flip_v == false:
					$Player.flip_v = true
				else:
					$Player.flip_v = false
		if (Input.is_action_pressed("left") and (is_on_floor() or is_on_ceiling())):
			if !Input.is_action_pressed("right"):
				$Player.flip_h = true
		elif Input.is_action_pressed("right") and (is_on_floor() or is_on_ceiling()):
			if !Input.is_action_pressed("left"):	
				$Player.flip_h = false
		elif Input.is_action_pressed("left") and !is_on_floor() and !is_on_ceiling():
			if !Input.is_action_pressed("right"):
				$Player.flip_h = true
			$AnimationPlayer.play("jump")
		elif Input.is_action_pressed("right") and !is_on_floor() and !is_on_ceiling():
			if !Input.is_action_pressed("left"):
				$Player.flip_h = false
			$AnimationPlayer.play("jump")
		var direction = Input.get_axis("left", "right")
		if direction or velocity.x != 0:
			$AnimationPlayer.play("walk")
			velocity.x = direction * SPEED
		else:
			$AnimationPlayer.play("idle")
			if air_time == true:
				$AnimationPlayer.play("jump")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	elif global.has_crystal == true:
		print($PointLight2D.texture_scale)
		$ambient.enabled = false
		if timer_running == false:
			$Timer.start()
			timer_running = true
		if timer2_running == false:
			$Timer2.start()
			timer2_running = true
		$PointLight2D.enabled = true
		if global.freeze == true and global.flag1 == false:
			$AnimationPlayer.play("idle_with_crystal")
			return
		if is_on_ceiling() or is_on_floor():
			jump = false
			yeeting = false
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump") and is_on_floor() and global.jump_allowed == true:
			jump = true
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("jump") and is_on_ceiling() and global.jump_allowed == true:
			jump = true
			velocity.y = -JUMP_VELOCITY
		if Input.is_action_just_pressed("jump") and !is_on_floor() and !is_on_ceiling() and yeeting == false and jump == true and global.jump_allowed == true:
				yeeting = true
				gravity = -gravity
				if gravity > 0:
					velocity.y = -JUMP_VELOCITY
				elif gravity < 0:
					velocity.y = JUMP_VELOCITY
				if $Player.flip_v == false:
					$Player.flip_v = true
				else:
					$Player.flip_v = false
		if (Input.is_action_pressed("left") and (is_on_floor() or is_on_ceiling())):
			if !Input.is_action_pressed("right"):
				$Player.flip_h = true
		elif Input.is_action_pressed("right") and (is_on_floor() or is_on_ceiling()):
			if !Input.is_action_pressed("left"):	
				$Player.flip_h = false
		elif Input.is_action_pressed("left") and !is_on_floor() and !is_on_ceiling():
			if !Input.is_action_pressed("right"):
				$Player.flip_h = true
			$AnimationPlayer.play("jump_with_crystal")
		elif Input.is_action_pressed("right") and !is_on_floor() and !is_on_ceiling():
			if !Input.is_action_pressed("left"):
				$Player.flip_h = false
			$AnimationPlayer.play("jump_with_crystal")
		var direction = Input.get_axis("left", "right")
		if direction:
			$AnimationPlayer.play("walk_with_crystal")
			velocity.x = direction * SPEED
		else:
			$AnimationPlayer.play("idle_with_crystal")
			if air_time == true:
				$AnimationPlayer.play("jump_with_crystal")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	if global.freeze == false:
		move_and_slide()

func make_player_move(value):
	$Player.flip_h = false
	$AnimationPlayer.play("walk")
	velocity.x = 1 * value
	move_and_slide()

func player():
	pass

func _on_area_2d_body_entered(body):
	air_time = false

func _on_area_2d_body_exited(body):
	air_time = true
	


func _on_timer_timeout():
	if $PointLight2D.texture_scale > 0.55:
		$PointLight2D.texture_scale *= 0.95
	timer_running = false


func _on_timer_2_timeout():
	$PointLight2D.enabled = false
	$PointLight2D.texture_scale = 1
	global.has_crystal = false
	timer2_running = false
	
