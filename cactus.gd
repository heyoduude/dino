extends Area2D

@export var speed=10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	collision_sharp_change()
	
func collision_sharp_change():
	$"1".disabled=true
	$"2".disabled=true
	$"3".disabled=true
	$"4".disabled=true
	$"5".disabled=true
	
	match $AnimatedSprite2D.animation:
		"1": 
			$"1".disabled=false
		"2": 
			$"2".disabled=false
		"3": 
			$"3".disabled=false
		"4": 
			$"4".disabled=false
		"5": 
			$"5".disabled=false

func _process(delta: float) -> void:
	position.x -=speed
	if position.x < -1000:
		queue_free()
