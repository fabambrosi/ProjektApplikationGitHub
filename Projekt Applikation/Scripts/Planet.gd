extends StaticBody2D

export(String,"Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Mond") var planet = "Erde"

var gravitation_liste = {"Merkur":3.7,"Venus":8.87,"Erde":9.81, "Mars":3.69, "Jupiter":24.79, "Saturn":10.44,"Uranus":8.87,"Neptun":11.15,"Pluto":0.66,"Mond":1.63}
#Im Bezug zur Erde, Faktor, Merkur /2,6: 

var planet_gravity = 1.0

func _ready():
	print(gravitation_liste[planet])

func _physics_process(delta):
	planet_gravity = gravitation_liste[planet]
