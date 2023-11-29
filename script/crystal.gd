extends Sprite2D

var player_in_range = false
var broken = false
var p

func _physics_process(delta):
	if broken == false:
		$AnimationPlayer.play("idle")
	if broken == true:
		$AnimationPlayer.play("broken")
	if player_in_range == true and Input.is_action_just_released("up"):
		broken = true
		#$PointLight2D.texture_scale *= 0.5
		$PointLight2D.energy = 0.4
		global.has_crystal = true

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		p = body
		player_in_range = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_range = false


