extends CharacterBody2D

enum {
	WALK,
	DEATH
}

const SPEED = 150.0
@onready var anim = $AnimatedSprite2D
var health = 100
var state = WALK

func _physics_process(delta: float) -> void:

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
	print(direction)
	
	if direction:
		velocity = Vector2(direction.x * SPEED,direction.y*SPEED) 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

		
	if direction.x == -1:
		anim.flip_h=true
	elif direction.x == 1: 
		anim.flip_h=false
	
	
	if direction:
		if direction.x!=0: 
			anim.play("walk_side")
		elif direction.y==-1:
			anim.play("walk_up")
		elif direction.y==1:
			anim.play("walk_down")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		anim.play("idle")

	
	if health<=0:
		state=DEATH





		
func death_state():
	if health<=0:
		health=0
		anim.play("death")
		await anim.animation_finished
		queue_free()
		get_tree(). change_scene_to_file("res://scene/menu.tscn")
