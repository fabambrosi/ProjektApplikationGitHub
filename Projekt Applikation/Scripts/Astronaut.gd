extends KinematicBody2D

var gravity = 0 #Abhängig vom Planet 

export var jump_force = 1 #Kann auch geändert werden, je nach Austronautentyp (Mensch, 930 N,  Känguru, ....)
export var mass = 75 #Kann im UI eingestellt werden

var velocity = 0


func _ready():
	$AnimatedSprite.speed_scale = 3

