extends Node
var game_paused: bool = false
@onready var lvl_up_menu = $CanvasLayer/Lvl_up
func _process(delta: float) -> void:

	if TransformSignal.game_paused == true:
		get_tree().paused = true
		lvl_up_menu.show()
	else:
		lvl_up_menu.hide()
		get_tree().paused = false
