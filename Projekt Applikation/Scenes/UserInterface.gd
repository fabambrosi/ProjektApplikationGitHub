extends Control

onready var planet_node = get_parent().get_parent().get_node("Planet")
onready var planet_selector = $PanelContainer/HBoxContainer/PlanetVBox/OptionButton
onready var gravity_text = $PanelContainer/HBoxContainer/PlanetVBox/LineEdit
onready var gravity_slider = $PanelContainer/HBoxContainer/PlanetVBox/VSlider

var planet_list = ["Sonne", "Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Mond"]
var gravity_dictionary = {"Sonne": 274, "Merkur":3.7,"Venus":8.87,"Erde":9.81, "Mars":3.69, "Jupiter":24.79, "Saturn":10.44,"Uranus":8.87,"Neptun":11.15,"Pluto":0.66,"Mond":1.63}
var current_planet = "Erde"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in planet_list:
		planet_selector.add_item(i)
	update_planet()

func _physics_process(_delta):
	planet_node.planet_gravity = gravity_text.value

func _on_OptionButton_item_selected(_index):
	update_planet()

func update_planet():
	current_planet = planet_list[planet_selector.selected]
	planet_node.planet = current_planet
	gravity_text.value = gravity_dictionary[current_planet]

func _on_VSlider_drag_ended(value_changed):
	gravity_text.value = gravity_slider.value

func _on_LineEdit_value_changed(value):
	gravity_slider.value = value
