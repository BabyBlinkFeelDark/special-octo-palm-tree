extends MagickAttacks

func _process(delta: float) -> void:
	if TransformSignal.count_ball!=0:
		spawn_ball()
	#BALL_SCENE = preload("res://scenes/env/exp_point.tscn")
