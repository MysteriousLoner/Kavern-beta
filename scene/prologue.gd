extends Node2D

var change_scene = false

func _ready():
	global.freeze = true
	global.ambient_light = false
	global.has_crystal = false
	$CharacterBody2D/PointLight2D.enabled = false
	$CharacterBody2D/ambient.enabled = false
	
func _physics_process(delta):
	if global.flag1 == true:
		$CharacterBody2D.make_player_move(300)
	if change_scene == true:
		$DirectionalLight2D.energy = $DirectionalLight2D.energy + 0.03
		
func _on_to_cave_entrance_body_entered(body):
	if body.has_method("player"):
		global.freeze = false
		global.flag1 = false
		$Timer.start()
		change_scene = true


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scene/cave_entrance.tscn")
	
