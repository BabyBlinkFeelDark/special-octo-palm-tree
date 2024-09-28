extends Node2D

const ENEMY_SCENE = preload("res://scripts/essence/knight/knight.tscn")
const POINT_SCENE = preload("res://scenes/env/exp_point.tscn")
@onready var player = $Player
var y = 0
var time_since_last_spawn: float = 0 
var spawn_cooldown: float = 1000.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(TransformSignal.player_exp)
	while y != 0:
		var knight = ENEMY_SCENE.instantiate()
		knight.global_position = (Vector2(randi_range(-50,50),randi_range(-50,50)))
		add_child(knight)
		y-=1
	time_since_last_spawn+=get_process_delta_time()
	if time_since_last_spawn>=spawn_cooldown:
		spawn_point()
		time_since_last_spawn = 0

		
func spawn_point():
	var point = POINT_SCENE.instantiate()
	point.global_position = (Vector2(randi_range(-500,500),randi_range(-500,500)))
	add_child(point)
	
