extends Node2D

const BALL_SCENE = preload("res://scenes/attack/fire_ball.tscn")
#@onready var player = $Player

var inst_ball
var angle_to_rotate: int = 0
var player: Vector2
var attacks = []
var rotaion_offset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	TransformSignal.connect("player_position_update", Callable(self, "_on_player_positiont_update"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_positiont_update(player_pos: Vector2):
	player = player_pos

		
