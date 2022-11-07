extends StaticBody2D

export(String,"Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Eigener") var planet = "Erde"

var gravitation_liste = {"Merkur":1,"Venus":2,"Erde":9.81}

func _ready():
	print(gravitation_liste[planet])
	
