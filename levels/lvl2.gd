extends Node2D

func _ready():
	global.freeze = true
	global.can_harvest = false
	DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "lvl2")
	await DialogueManager.dialogue_ended
	global.freeze = false
	global.jump_allowed = true


func _on_killzone_body_entered(body):
	if body.has_method("player"):
		global.has_crystal = false
		get_tree().change_scene_to_file("res://levels/lvl2.tscn")



func _on_transition_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://levels/lvl3.tscn")
