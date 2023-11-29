extends Control


func _on_play_pressed():
	global.flag1 = true

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Options/input_settings.tscn")


func _on_quit_pressed():
	get_tree().quit()




func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Credits/credits.tscn")
