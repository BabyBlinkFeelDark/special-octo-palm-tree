extends Node2D

var exp: int 
@onready var player = get_node("res://scripts/essence/player/player.gd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	TransformSignal.player_exp+=20
	queue_free()
