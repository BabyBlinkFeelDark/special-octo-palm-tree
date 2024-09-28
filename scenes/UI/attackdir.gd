extends Node2D
var mouse: Vector2
var alpha: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse = get_viewport().get_mouse_position()
	alpha=(mouse.x*TransformSignal.cross_p.x+ mouse.y*TransformSignal.cross_p.y)/(sqrt(mouse.x+mouse.y)+sqrt(TransformSignal.cross_p.x+TransformSignal.cross_p.y))
	
	print("mouse ", mouse)
	#print("cross_p ", TransformSignal.cross_p)
	#rotation = acos(cos(alpha))*(180/3.14)
	#print("cross ", acos(cos(alpha))*(180/3.14))
