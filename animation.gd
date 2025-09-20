extends Node

@onready var main_script = load("res://main.gd")

@export var money_icon_scene: PackedScene

var speed = 200
var npcs = []  # store all NPC nodes
var spawn_timer = 1.0
var spawn_interval = 0.5
var max_npcs = 5

var runAnimation: bool = false
var original_position

# store per-NPC sold status
var npc_sold = {}

func _ready():
	max_npcs = randi_range(main_script.min_customers, main_script.max_customers)
	print(max_npcs)
	var original = $SubViewport/Sprite2D/AnimatedSprite2D
	npcs.append(original)
	original_position = original.global_position
	npc_sold[original] = false  # original NPC hasn't sold yet

func animate(delta):
	for npc in npcs:
		npc.position.x += speed * delta
		npc.position.y -= (speed - 90) * delta
		
		# only run sell_tea once per NPC
		if abs(npc.position.x - 300) < 1.0 and !npc_sold[npc]:
			sell_tea()
			npc_sold[npc] = true

	# Handle timed spawning
	spawn_timer += delta
	if spawn_timer >= spawn_interval and npcs.size() < max_npcs:
		spawn_timer = 0
		var original = $SubViewport/Sprite2D/AnimatedSprite2D
		var npc = original.duplicate()
		
		# Set the duplicate's global transform to match the original
		npc.global_position = original_position
		npc.global_rotation = original.global_rotation
		npc.global_scale = original.global_scale

		$SubViewport.add_child(npc)
		npcs.append(npc)
		npc_sold[npc] = false  # new NPC hasn't sold yet

func sell_tea():
	main_script.account_balance += main_script.tea_min_price
	print("Sold")

func _process(delta):
	if runAnimation:
		animate(delta)

func _on_button_pressed() -> void:
	runAnimation = true
