extends Node

var main_script = load("res://main.gd")

# --- Milk ---
static var milk1: int = 4
static var milk1_price: float = 120
static var milk1_count: int = 0
static var milk2: int = 8
static var milk2_price: float = 180
static var milk2_count: int = 0
static var milk3: int = 16
static var milk3_price: float = 300
static var milk3_count: int = 0

# --- Cups ---
static var cup1: int = 16
static var cup1_price: float = 12.0
static var cup1_count: int = 0
static var cup2: int = 32
static var cup2_price: float = 20.0
static var cup2_count: int = 0
static var cup3: int = 64
static var cup3_price: float = 32.0
static var cup3_count: int = 0

# --- Sugar ---
static var sugar1: int = 1
static var sugar1_price: float = 50.0
static var sugar1_count: int = 0
static var sugar2: int = 2
static var sugar2_price: float = 80.0
static var sugar2_count: int = 0
static var sugar3: int = 4
static var sugar3_price: float = 144.0
static var sugar3_count: int = 0

# --- Tea ---
static var tea1: int = 5
static var tea1_price: float = 15.0
static var tea1_count: int = 0
static var tea2: int = 10
static var tea2_price: float = 24.0
static var tea2_count: int = 0
static var tea3: int = 20
static var tea3_price: float = 36.0
static var tea3_count: int = 0

# --- Current selection ---
static var currently_selected: String
static var curr1
static var curr1_price
static var curr2
static var curr2_price
static var curr3
static var curr3_price

static var canBuy : bool = false

static var total_cost

func _ready():
	milk() # Default selection
	
func _process(delta: float) -> void:
	ui_updated()

# --- Helpers to update counts ---
func set_count(label_path: String, value: int):
	$ColorRect/UI.get_node(label_path).text = str(value)
	
func ui_updated():
	total_cost = cup1_count * cup1_price \
		+ cup2_count * cup2_price \
		+ cup3_count * cup3_price \
		+ tea1_count * tea1_price \
		+ tea2_count * tea2_price \
		+ tea3_count * tea3_price \
		+ sugar1_price * sugar1_count \
		+ sugar2_count * sugar2_price \
		+ milk1_price * milk1_count \
		+ milk2_price * milk2_count \
		+ milk3_price * milk3_count

	canBuy = total_cost <= main_script.account_balance

	if !canBuy:
		$ColorRect/UI/Box1/PlusHalf.disabled = true
		$ColorRect/UI/Box1/PlusHalf2.disabled = true
		$ColorRect/UI/Box2/PlusHalf.disabled = true
		$ColorRect/UI/Box2/PlusHalf2.disabled = true
		$ColorRect/UI/Box3/PlusHalf.disabled = true
		$ColorRect/UI/Box3/PlusHalf2.disabled = true
	else:
		$ColorRect/UI/Box1/PlusHalf.disabled = false
		$ColorRect/UI/Box1/PlusHalf2.disabled = false
		$ColorRect/UI/Box2/PlusHalf.disabled = false
		$ColorRect/UI/Box2/PlusHalf2.disabled = false
		$ColorRect/UI/Box3/PlusHalf.disabled = false
		$ColorRect/UI/Box3/PlusHalf2.disabled = false


# --- Minus functions ---
func minus1():
	match currently_selected:
		"milk":
			milk1_count = max(milk1_count - 1, 0)
			set_count("Option1Count/Label", milk1_count * milk1)
		"cup":
			cup1_count = max(cup1_count - 1, 0)
			set_count("Option1Count/Label", cup1_count * cup1)
		"tea":
			tea1_count = max(tea1_count - 1, 0)
			set_count("Option1Count/Label", tea1_count * tea1)
		"sugar":
			sugar1_count = max(sugar1_count - 1, 0)
			set_count("Option1Count/Label", sugar1_count * sugar1)

func minus2():
	match currently_selected:
		"milk":
			milk2_count = max(milk2_count - 1, 0)
			set_count("Option2Count/Label", milk2_count * milk2)
		"cup":
			cup2_count = max(cup2_count - 1, 0)
			set_count("Option2Count/Label", cup2_count * cup2)
		"tea":
			tea2_count = max(tea2_count - 1, 0)
			set_count("Option2Count/Label", tea2_count * tea2)
		"sugar":
			sugar2_count = max(sugar2_count - 1, 0)
			set_count("Option2Count/Label", sugar2_count * sugar2)

func minus3():
	match currently_selected:
		"milk":
			milk3_count = max(milk3_count - 1, 0)
			set_count("Option3Count/Label", milk3_count * milk3)
		"cup":
			cup3_count = max(cup3_count - 1, 0)
			set_count("Option3Count/Label", cup3_count * cup3)
		"tea":
			tea3_count = max(tea3_count - 1, 0)
			set_count("Option3Count/Label", tea3_count * tea3)
		"sugar":
			sugar3_count = max(sugar3_count - 1, 0)
			set_count("Option3Count/Label", sugar3_count * sugar3)

# --- Plus functions ---
func plus1():
	match currently_selected:
		"milk":
			milk1_count += 1
			set_count("Option1Count/Label", milk1_count * milk1)
		"cup":
			cup1_count += 1
			set_count("Option1Count/Label", cup1_count * cup1)
		"tea":
			tea1_count += 1
			set_count("Option1Count/Label", tea1_count * tea1)
		"sugar":
			sugar1_count += 1
			set_count("Option1Count/Label", sugar1_count * sugar1)

func plus2():
	match currently_selected:
		"milk":
			milk2_count += 1
			set_count("Option2Count/Label", milk2_count * milk2)
		"cup":
			cup2_count += 1
			set_count("Option2Count/Label", cup2_count * cup2)
		"tea":
			tea2_count += 1
			set_count("Option2Count/Label", tea2_count * tea2)
		"sugar":
			sugar2_count += 1
			set_count("Option2Count/Label", sugar2_count * sugar2)

func plus3():
	match currently_selected:
		"milk":
			milk3_count += 1
			set_count("Option3Count/Label", milk3_count * milk3)
		"cup":
			cup3_count += 1
			set_count("Option3Count/Label", cup3_count * cup3)
		"tea":
			tea3_count += 1
			set_count("Option3Count/Label", tea3_count * tea3)
		"sugar":
			sugar3_count += 1
			set_count("Option3Count/Label", sugar3_count * sugar3)

# --- Selection functions ---
func milk():
	currently_selected = "milk"
	curr1 = milk1
	curr1_price = milk1_price
	$ColorRect/UI/Box1/Sprite2D.texture = load("res://milk.png")
	$ColorRect/UI/Box2/Sprite2D.texture = load("res://milk2.png")
	$ColorRect/UI/Box3/Sprite2D.texture = load("res://milk3.png")

	$ColorRect/UI/Option1.text = str(milk1) + " Milk Packets\n" + str(milk1_price) + " Rs"
	$ColorRect/UI/Option2.text = str(milk2) + " Milk Packets\n" + str(milk2_price) + " Rs"
	$ColorRect/UI/Option3.text = str(milk3) + " Milk Packets\n" + str(milk3_price) + " Rs"

func cup():
	currently_selected = "cup"
	curr1 = cup1
	curr1_price = cup1_price
	$ColorRect/UI/Box1/Sprite2D.texture = load("res://cup.png")
	$ColorRect/UI/Box2/Sprite2D.texture = load("res://cup2.png")
	$ColorRect/UI/Box3/Sprite2D.texture = load("res://cup3.png")

	$ColorRect/UI/Option1.text = str(cup1) + " Cups\n" + str(cup1_price) + " Rs"
	$ColorRect/UI/Option2.text = str(cup2) + " Cups\n" + str(cup2_price) + " Rs"
	$ColorRect/UI/Option3.text = str(cup3) + " Cups\n" + str(cup3_price) + " Rs"

func sugar():
	currently_selected = "sugar"
	curr1 = sugar1
	curr1_price = sugar1_price
	$ColorRect/UI/Box1/Sprite2D.texture = load("res://sugar.png")
	$ColorRect/UI/Box2/Sprite2D.texture = load("res://sugarx2.png")
	$ColorRect/UI/Box3/Sprite2D.texture = load("res://sugarx3.png")

	$ColorRect/UI/Option1.text = str(sugar1) + " Sugar Packets\n" + str(sugar1_price) + " Rs"
	$ColorRect/UI/Option2.text = str(sugar2) + " Sugar Packets\n" + str(sugar2_price) + " Rs"
	$ColorRect/UI/Option3.text = str(sugar3) + " Sugar Packets\n" + str(sugar3_price) + " Rs"

func tea():
	currently_selected = "tea"
	curr1 = tea1
	curr1_price = tea1_price
	$ColorRect/UI/Box1/Sprite2D.texture = load("res://teabag.png")
	$ColorRect/UI/Box2/Sprite2D.texture = load("res://tea2.png")
	$ColorRect/UI/Box3/Sprite2D.texture = load("res://tea3.png")

	$ColorRect/UI/Option1.text = str(tea1) + " Tea Bags\n" + str(tea1_price) + " Rs"
	$ColorRect/UI/Option2.text = str(tea2) + " Tea Bags\n" + str(tea2_price) + " Rs"
	$ColorRect/UI/Option3.text = str(tea3) + " Tea Bags\n" + str(tea3_price) + " Rs"


func milk_selected() -> void:
	pass # Replace with function body.


var has_bought: bool = false

func _on_buy_pressed() -> void:
	if has_bought:
		return  # do nothing if already bought

	main_script.account_balance -= total_cost
	has_bought = true  # mark as done
	print("Purchase successful! New balance: ", main_script.account_balance)
