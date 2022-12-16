extends KinematicBody2D

var screen_size

var gravity = 0 #Erde,Abhängig vom Planet 
var motion_factor = 30

export var jump_force = 160 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden

var velocity = Vector2()
const Up_Vector = Vector2(0, -1)

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	gravity = get_parent().get_node("Planet").planet_gravity
	velocity.x = 0
	velocity.y += gravity * delta * motion_factor
	check_key_input()
	move()
	reset_position()

	velocity = move_and_slide(velocity, Up_Vector)

func check_key_input():
	if Input.is_action_just_pressed("w") and is_on_floor():
		velocity.y = -jump_force  

func move():
	if Input.is_action_pressed("a"):
		position.x = position.x -1
	if Input.is_action_pressed("d"):
		position.x = position.x +1

func reset_position():
	if position.y > screen_size.y:
		position.y = -10
	if position.x < -10:
		position.x = screen_size.x + 8
	if position.x > screen_size.x + 10:
		position.x = - 8
