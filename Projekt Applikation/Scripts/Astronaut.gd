extends KinematicBody2D

var screen_size

var gravity = 9.81 #Erde,Abhängig vom Planet 


export var jump_force = 20 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden


var velocity = Vector2()
const Up_Vector = Vector2(0, -1)

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	velocity.x = 0
	velocity.y += gravity * delta
	
	check_key_input()

	
	move_and_slide(velocity, Up_Vector)
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)

func check_key_input():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force  
