extends CharacterBody2D
class_name Player


enum {
	WALK,
	DEATH
}


const SPEED = 150.0
@onready var anim = $AnimatedSprite2D
@onready var anim_pl = $AnimatedSprite2D
var health: int = 100
var exp: int = 0
var emit_xp: int
var state = WALK
var player_pos: Vector2
var player: Vector2
var fire_ball: MagickAttacks

func _ready() -> void:
	pass
		
func _physics_process(delta: float) -> void:

	if Input.is_action_just_pressed("ui_accept"):
		TransformSignal.player_exp+=20

		#print(attacks)

	emit_xp = exp
	
	TransformSignal.emit_signal("player_position_update", player_pos)
	
	match state:
		WALK:
			walk_state(delta)
		DEATH:
			death_state()
	move_and_slide()
	

func walk_state(vel_del):
	TransformSignal.player_p = position

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
		
