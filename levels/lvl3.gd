extends Node2D
var triger = false
var t2 = false


func _ready():
	global.jump_allowed = true
	global.freeze = true
	DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "lvl3")
	await DialogueManager.dialogue_ended
	global.freeze = false
	return

func _on_area_2d_body_entered(body):
	if body.has_method("player") and triger == false:
		global.freeze = true
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "lvl3a")
		await DialogueManager.dialogue_ended
		triger = true
		$CharacterBody2D.gravity *= -1
		$CharacterBody2D/Player.flip_v = true
		global.has_crystal = true
		global.freeze = false
		global.switch_allowed = true
		return
		


func _on_killzone_body_entered(body):
	if body.has_method("player"):
		global.has_crystal = false
		get_tree().change_scene_to_file("res://levels/lvl3.tscn")


func _on_area_2d_2_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://levels/lvl5.tscn")
