extends Control


onready var planet_selector = $PanelContainer/HBoxContainer/PlanetVBox/OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_node("/root/App/World/Planet").planeten_liste:
		planet_selector.add_item(i)
