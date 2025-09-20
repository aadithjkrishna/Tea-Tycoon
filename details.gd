extends Node

func _ready():
	var scenes = [load("res://result.tscn").instantiate(), load("res://rent.tscn").instantiate(), load("res://recipe.tscn").instantiate(), load("res://supplies.tscn").instantiate()]
	
	$DetailsBox.add_child(scenes[3])


func _on_supplies_pressed() -> void:
	pass # Replace with function body.
