extends StaticBody2D

export(String,"Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Mond") var planet = "Erde"

var gravitation_liste = {"Merkur":3.7,"Venus":8.87,"Erde":9.81, "Mars":3.69, "Jupiter":24.79, }

func _ready():
	print(gravitation_liste[planet])
	
