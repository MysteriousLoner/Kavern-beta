extends Sprite2D


var bol = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_anything_pressed() and bol == true:
		get_tree().change_scene_to_file("res://Credits/credits.tscn")

func _on_timer_timeout():
	$Timer.stop()
	bol = true
