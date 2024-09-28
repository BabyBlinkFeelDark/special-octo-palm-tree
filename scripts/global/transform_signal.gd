extends Node

signal player_position_update(_player_pos: Vector2)
signal hit_to_body(canHit: bool)
var need_player_exp = 20
var player_exp: int
var game_paused: bool = false
var count_ball = 0

var player_p:Vector2
var cross_p:Vector2
var attackdir:float
var inner_canHit
var damage_cooldown: float = 0.1
var time_since_last_damage: float = 2.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_exp = need_player_exp
	pass # Replace with function body.a


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_since_last_damage+=get_process_delta_time()

		
	#print("inner_canHit: ", str(inner_canHit))
	if player_exp>need_player_exp:
		game_paused = true	
	pass
