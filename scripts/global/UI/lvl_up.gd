extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	TransformSignal.count_ball+=1
	TransformSignal.game_paused=false
	TransformSignal.need_player_exp*=1.2
	TransformSignal.player_exp=0
	

func _on_button_2_pressed() -> void:
	TransformSignal.game_paused=false
	TransformSignal.need_player_exp*=1.2
	TransformSignal.player_exp=0


func _on_button_3_pressed() -> void:
	TransformSignal.game_paused=false
	TransformSignal.need_player_exp*=1.2
	TransformSignal.player_exp=0
