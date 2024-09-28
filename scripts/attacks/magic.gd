extends Node
class_name MagickAttacks

var BALL_SCENE = preload("res://scenes/attack/fire_ball.tscn")
var inst_ball = 0
var angle_to_rotate: int = 0
var player: Vector2
var attacks = []
var rotaion_offset
var player_pos: Vector2
var ball_rotate_velocity = 5

func _ready() -> void:
	inst_ball = TransformSignal.count_ball
	print("TransformSignal.count_ball")




func spawn_ball():
	if TransformSignal.count_ball < 1:
		rotaion_offset = 0
	else:
		rotaion_offset = 360/TransformSignal.count_ball
	while inst_ball != TransformSignal.count_ball:
		var ball = BALL_SCENE.instantiate()
		attacks.append(ball)
		ball.position = player
		ball.rotation_degrees = angle_to_rotate
		angle_to_rotate += rotaion_offset
		add_child(ball)
		inst_ball+=1
	for cast in attacks:
		cast.rotation_degrees+=ball_rotate_velocity
	for i in range(1,len(attacks)):
		attacks[i].rotation_degrees= attacks[i-1].rotation_degrees + rotaion_offset
		
