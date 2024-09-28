extends CharacterBody2D

@onready var player = $"../Player"
@onready var anim_player = $AnimationPlayer
@onready var anim = $AnimatedSprite2D

const SPEED = 60.0
var state = WALK
var health = 100
var direction: Vector2
var its_player = false
var attack_cooldown: float = 2.0
var time_since_last_attack: float = 2
enum {
	WALK,
	DEATH,
	HIT
}


func _ready() -> void:

	pass

func _physics_process(delta: float) -> void:


	match state:
		WALK:
			walk_state(delta)
		DEATH:
			death_state()
		HIT:
			hit_state()
	
	
	if player.global_position.x - global_position.x>0:
		direction.x=-1

	elif player.global_position.x - global_position.x<0:
		direction.x=1

	if player.global_position.y - global_position.y>0:
		direction.y=-1

	elif player.global_position.y - global_position.y<0:
		direction.y=1

	
	move_and_slide()
func walk_state(vel_del):
	

	if player:
		position.x = move_toward(position.x, player.position.x, SPEED*vel_del)
		position.y = move_toward(position.y, player.position.y, SPEED*vel_del)		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if health<=0:
		state=DEATH
	elif its_player==true:
		state = HIT
	anim.play("walk_down")


		
func death_state():
	if health<=0:
		queue_free()


func hit_state():
	anim.play("down_attack")
	time_since_last_attack+=get_process_delta_time()
	if time_since_last_attack>=attack_cooldown:
		hit()
	if its_player == false:
		state = WALK
		
func hit():
	player.health-=1

	time_since_last_attack = 0
		
func _on_hit_boxes_body_entered(body: Node2D) -> void:
	its_player=true


func _on_hit_boxes_body_exited(body: Node2D) -> void:
	its_player=false
