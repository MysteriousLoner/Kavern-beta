extends Node2D


func _ready():
	global.freeze = false
	global.jump_allowed = true
	global.switch_allowed = true

func _on_kill_body_entered(body):
	global.has_crystal = false
	get_tree().change_scene_to_file("res://levels/lvl6.tscn")
	



func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scene/End.tscn")
