extends Node

var move = false
var triggered_dialogue = false

# Called when the node enters the scene tree for the first time.
func _ready():
	global.freeze = true
	global.can_harvest = false
	DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "cave")
	await DialogueManager.dialogue_ended
	global.freeze = false
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_area_2d_body_entered(body):
	move = false
	if triggered_dialogue == false:
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "cave2")
		await DialogueManager.dialogue_ended
	triggered_dialogue = true
	move = true
	return


func _on_area_2d_2_body_entered(body):
	if body.has_method("player"):
		print("here")
		get_tree().change_scene_to_file("res://levels/lvl2.tscn")
	
