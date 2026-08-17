extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var velocity = 0 # The player's movement vector.
	if Input.is_action_pressed("jump"):
		pass
		#velocity=400
		
