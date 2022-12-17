extends KinematicBody2D

onready var animation = get_node("AnimatedSprite")

var screen_size

var gravity = 1.0 #Abhängig vom Planet
var gravity_factor = 1.0
var motion = Vector2.ZERO


export var mass = 75 #Kann im UI eingestellt werden
export var jump_force = 32.5
export var speed = 50

var pixel_per_meter = 10.0
var updates_per_second = 60.0

var velocity = Vector2()
const Up_Vector = Vector2(0, -1)

func _ready():
	screen_size = get_viewport_rect().size
	gravity_factor = pixel_per_meter/updates_per_second 
	print(gravity_factor)
	# -> (10/m)/(60/s)=10s/60m
	# Multipliziert mit Graviation z.B. 9.81 m/s^2 * 1/6 s/m = 1.635/s

func _physics_process(_delta):
	gravity = get_parent().get_node("Planet").planet_gravity
	if !is_on_floor():
		velocity.y += gravity * gravity_factor
	check_key_input()
	reset_position()
	animate_player()
	move()

func move():
#	velocity = move_and_slide(velocity, Up_Vector)
	motion = move_and_slide(velocity,Up_Vector)
	if is_on_floor():
		velocity.y = 0.01
	

func check_key_input():
	if Input.is_action_just_pressed("w") and is_on_floor():
		velocity.y = -jump_force*(1+(int(Input.is_action_pressed("Shift")))*1.5)
	velocity.x = (int(Input.is_action_pressed("d"))- int(Input.is_action_pressed("a")))*speed*(1+(int(Input.is_action_pressed("Shift")))*0.5)


func reset_position():
	if position.y > screen_size.y:
		position.y = -8
	if position.x < -6:
		position.x = screen_size.x + 5
	if position.x > screen_size.x + 6:
		position.x = - 5

func animate_player():
	if !is_on_floor():
		animation.animation = "Jump"
	else:
		if motion.x != 0:
			animation.animation = "Walk"
		else:
			animation.animation = "Idle"

	if velocity.x < 0:
		animation.scale.x = -1
	elif velocity.x > 0:
		animation.scale.x = 1
	if Input.is_action_pressed("Shift"):
		modulate = Color(1,0.75,0.75)
	else:
		modulate = Color(1,1,1)
