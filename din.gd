extends CharacterBody2D

const JUMP_VELOCITY = -1400.0

func _ready() -> void:
	velocity.y = JUMP_VELOCITY/2

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * 4 * delta
		
	if is_on_floor():
		$AnimatedSprite2D.play("run")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.stop()
	
	move_and_slide()
