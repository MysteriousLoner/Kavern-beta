extends Node2D
var triggered_dialogue = false
var triggered_dialogue2 = false
var move = false


# Called when the node enters the scene tree for the first time.
func _ready():
	global.freeze = true
	$Timer.start()
	pass # Replace with function body.
	
func _on_timer_timeout():
	global.freeze = false
	$Timer.stop()
	DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "start")
	await DialogueManager.dialogue_ended
	move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $DirectionalLight2D2.energy > 0:
		$DirectionalLight2D2.energy -= 0.04
	if move == true and triggered_dialogue2 == false:
		$nathan.velocity.x = 200
		$Kyle.velocity.x = 200
	elif move == true and triggered_dialogue2 == true:
		$nathan.velocity.x = 400
		$Kyle.velocity.x = 400
	else:
		$Kyle.velocity.x = 0
		$nathan.velocity.x = 0

func _on_saw_cave_body_entered(body: Node):
	if body.has_method("nathan") and triggered_dialogue == false:
		move = false
		$nathan.CROUCH = true
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "hole")
		await DialogueManager.dialogue_ended
		triggered_dialogue = true
	if triggered_dialogue == true:
		global.freeze = false
		get_tree().change_scene_to_file("res://levels/level.tscn")
	return


func _on_area_2d_body_entered(body: Node):
	if body.has_method("nathan") and triggered_dialogue2 == false:
		move = false
		$nathan/natan.flip_h = true
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "midway")
		await DialogueManager.dialogue_ended
		triggered_dialogue2 = true
		$nathan/natan.flip_h = false
		move = true
		return
