extends Node

signal player_position_update(_player_pos: Vector2)
signal player_exp_update(player_ex: int)
var need_player_exp = 20
var player_exp: int
var game_paused: bool = false
var count_ball = 0
var player_p:Vector2




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_exp = need_player_exp
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_exp>need_player_exp:
		game_paused = true
		
	pass
	#if player_exp>100:
		#print("lvl up!!! CONGRATILATION!!!!")
