extends CharacterBody2D
class_name Player
enum {
	WALK,
	DEATH
}



const BALL_SCENE = preload("res://scenes/attack/fire_ball.tscn")
var inst_ball = 0
var angle_to_rotate: int = 0
var player: Vector2
var attacks = []
var rotaion_offset


const SPEED = 150.0
@onready var anim = $AnimatedSprite2D
@onready var anim_pl = $AnimatedSprite2D
var health: int = 100
var exp: int = 0
var emit_xp: int
var state = WALK
var player_pos: Vector2




		
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		TransformSignal.player_exp+=20
	if TransformSignal.count_ball!=0:
		spawn_ball()
		#print(attacks)

	emit_xp = exp
	TransformSignal.player_p = position
	TransformSignal.emit_signal("player_position_update", player_pos)
	
	match state:
		WALK:
			walk_state(delta)
		DEATH:
			death_state()
	move_and_slide()
	

func walk_state(vel_del):
	var direction : Vector2
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")

	if direction:
		velocity = Vector2(direction.x * SPEED,direction.y*SPEED) 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

		
	if direction.x == -1:
		anim.flip_h=true
	elif direction.x == 1: 
		anim.flip_h=false
	
	if direction.y<0:
		if direction.x!=0: 
			anim_pl.play("walk_up_side")
		elif direction.x==0: 
			anim_pl.play("walk_up")
	elif direction.y>0:
		if direction.x!=0: 
			anim_pl.play("walk_down_side")
		elif direction.x==0:
			anim_pl.play("walk_down")
	elif direction.y==0 and direction.x!=0:
		anim_pl.play("walk_side")
	elif direction==Vector2.ZERO:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("idle")
	#print(state)
	
	if health<=0:
		state=DEATH





		
func death_state():
	anim_pl.play("death")
		#queue_free()
		#get_tree(). change_scene_to_file("res://scene/menu.tscn")
		
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
		cast.rotation_degrees+=TransformSignal.ball_rotate_velocity
	for i in range(1,len(attacks)):
		attacks[i].rotation_degrees= attacks[i-1].rotation_degrees + rotaion_offset
