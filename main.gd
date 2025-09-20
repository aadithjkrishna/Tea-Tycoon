extends Node

static var max_customers = 50
static var customers: int
static var account_balance: float = 250.0

var total_npc = 60;

var supplies = load("res://supplies.gd")

# rainy -> more cust
# sunny -> less cust
#cold -> medium cust

# cup, sugar_packet, milk_packet

static var cup_count: int = 0
static var sugar_count: int = 0
static var milk_count: int = 0
static var tea_count: int = 0

static var no_of_cups: int = 16
static var no_of_sugar_packets: int = 2
static var no_of_milk_packets: int = 4
static var no_of_tea_bags: int = 10

static var cup_price: float = 0.75 # 1 tea 8 multiples
static var sugar_price: float = 50 # 100 tea 1 multiples
static var milk_price: float = 30 # 10 tea 2 multiples
static var tea_bag_price: float = 3 # 1 tea 5 multiples

static var cup_to_tea: int = 1
static var sugar_to_tea_conv: int = 100
static var milk_to_tea_conv: int = 10
static var tea_bag_to_tea: int = 1

static var cup_multiples: int = 8
static var sugar_multiples: int = 1
static var milk_multiples: int = 2
static var tea_bag_multiples: int = 5

static var cup_price_label: float = cup_price * no_of_cups
static var sugar_price_label: float = sugar_price * no_of_sugar_packets
static var milk_price_label: float = milk_price * no_of_milk_packets
static var tea_bag_price_label: float = tea_bag_price * no_of_tea_bags

static var tea_min_price: float = cup_price + sugar_price / sugar_to_tea_conv + milk_price / milk_to_tea_conv + tea_bag_price

static var min_customers: int

var weather_conditions: Array[String] = ["Rainy", "Sunny", "Cold"]

func _ready():
	start_game()
	
func _process(delta):
	$NavBar/tea_bag.text = str(supplies.tea1 * supplies.tea1_count + supplies.tea2 * supplies.tea2_count + supplies.tea3 * supplies.tea3_count)
	$NavBar/cup.text = str(supplies.cup1 * supplies.cup1_count + supplies.cup2 * supplies.cup2_count + supplies.cup3 * supplies.cup3_count)
	$NavBar/sugar.text = str(supplies.sugar1 * supplies.sugar1_count + supplies.sugar2 * supplies.sugar2_count + supplies.sugar3 * supplies.sugar3_count)
	$NavBar/milk.text = str(supplies.milk1 * supplies.milk1_count + supplies.milk2 * supplies.milk2_count + supplies.milk3 * supplies.milk3_count)
	$NavBar/account_balance.text = "Balance: " + str(account_balance) + " Rs"

func start_game():
	var current_weather = weather_conditions[randi() % weather_conditions.size() - 1]
	$Weather/Label.text = current_weather
	$NavBar/tea_bag.text = str(tea_count)
	$NavBar/cup.text = str(cup_count)
	$NavBar/sugar.text = str(sugar_count)
	$NavBar/milk.text = str(milk_count)
	$NavBar/account_balance.text = "Balance: " + str(account_balance) + " Rs"
	
	match current_weather:
		"Rainy":
			min_customers = max_customers * 90 / 100
			print("rainy")
		"Sunny":
			min_customers = max_customers * 40 / 100
			print("sunny")
		"Cold":
			min_customers = max_customers * 60 / 100
			print("cold")
	customers = randi_range(min_customers, max_customers)
	var npc: int = total_npc - customers
	print(customers)
