extends Node2D

onready var camera = $Camera2D
onready var astronaut = $Astronaut

var zoom_factor = 0.6

func _ready():
	camera.zoom = Vector2(zoom_factor,zoom_factor)

func _process(delta):
	camera.position = astronaut.position
