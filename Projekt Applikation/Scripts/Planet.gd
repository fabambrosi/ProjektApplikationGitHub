extends StaticBody2D

onready var sprite = $AnimatedSprite

export(String, "Sonne", "Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Mond") var planet = "Erde"

#Im Bezug zur Erde, Faktor, Merkur /2,6: 

var planet_gravity = 1.0

func _process(_delta):
	sprite.animation = planet
