extends Node2D
var trig = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if trig == false:
		global.freeze = true
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "lvl5")
		await DialogueManager.dialogue_ended
		trig = true
		global.jump_allowed = true
		global.switch_allowed = true
		global.freeze = false
		return


func _on_kill_body_entered(body):
	global.has_crystal = false
	get_tree().change_scene_to_file("res://levels/lvl5.tscn")


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://levels/lvl6.tscn")
