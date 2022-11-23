extends KinematicBody2D

var screen_size

var gravity = 0 #Erde,Abhängig vom Planet 
var motion_factor = 30

export var jump_force = 160 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden


var velocity = Vector2()
const Up_Vector = Vector2(0, -1)

var z = 0

func _ready():
	
	screen_size = get_viewport_rect().size

func _process(delta):
	
	gravity = get_parent().get_node("Planet").planet_gravity
	velocity.x = 0
	print(gravity)
	velocity.y += gravity * delta * motion_factor
	check_key_input()

	
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Up_Vector)
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	

func check_key_input():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force  
