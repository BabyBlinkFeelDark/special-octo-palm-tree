extends Control

#Отработка логики выбора улучшения
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
