extends Node2D

var canHit:bool = false
func _process(delta: float) -> void:
	if TransformSignal.time_since_last_damage>TransformSignal.damage_cooldown:
		$Area2D.monitorable=true
		$Area2D.monitoring=true
	if TransformSignal.time_since_last_damage==0:
		$Area2D.monitorable=false
		$Area2D.monitoring=false
func _on_area_2d_body_entered(body: Node2D) -> void:
	canHit = true
	TransformSignal.inner_canHit = true
	#print(canHit)
	#print(TransformSignal.inner_canHit)
	TransformSignal.emit_signal("hit_to_body", canHit)


func _on_area_2d_body_exited(body: Node2D) -> void:
		TransformSignal.inner_canHit = false
