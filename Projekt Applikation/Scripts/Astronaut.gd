extends KinematicBody2D

var screen_size

export(String,"Merkur", "Venus", "Erde", "Mars", "Jupiter", "Saturn", "Uranus", "Neptun", "Pluto", "Mond") var planet = "Jupiter"
var faktor_fallbeschleunigung_liste = {"Merkur":0.377,"Venus":0.904,"Erde":1,"Mars":0.396,"Jupiter":2.545,"Saturn":1.064,"Uranus":0.904,"Neptun":1.136,"Pluto":0.067,"Mond":0.166}

var gravity = 300 #Erde,Abhängig vom Planet 


export var jump_force = 160 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden


var velocity = Vector2()
const Up_Vector = Vector2(0, -1)

var z = 0

func _ready():
	
	screen_size = get_viewport_rect().size
	z = float(faktor_fallbeschleunigung_liste[planet])
	print(z)

func _process(delta):
	
	velocity.x = 0
	velocity.y += gravity * delta * z
	check_key_input()

	
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Up_Vector)
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	

func check_key_input():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force  
