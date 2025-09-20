extends Node

@onready var details_box = $"../DetailsView/Details/DetailsBox"


var scene_paths = [
	"res://result.tscn",
	"res://rent.tscn",
	"res://recipe.tscn",
    "res://supplies.tscn"
]

func show_scene(index: int):
	for child in details_box.get_children():
		child.queue_free()

	var new_scene = load(scene_paths[index]).instantiate()
	details_box.add_child(new_scene)

func ResultsPressed():
	show_scene(0)

func RentPressed():
	show_scene(1)

func RecipePressed():
	show_scene(2)

func SuppliesPressed():
	show_scene(3)

func _ready():
	print("Ready")
