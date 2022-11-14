extends KinematicBody2D

var screen_size

var gravity = 2 #Abhängig vom Planet 

export var jump_force = 1 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden

export var speed = 100


func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("jump"):
		velocity.y -= 1  #oder Formel für die Gravitation 
		velocity.y += gravity
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	#else:
		#$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
