extends Node

@export var cactus_scene: PackedScene

var score=0
var hscore=0

func _ready() -> void:
	new_game()
	$display/TextLabel.visible=false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and get_tree().paused == true :
		new_game()
		
	print_score()
	 
func print_score():
	if hscore < score:
		hscore=score
	$display/HighScoreLabel.text = str("%05d" % hscore)
	$display/ScoreLabel.text = str("%05d" % score)

func _on_score_timer_timeout() -> void:
	score+=1
	

func _on_mob_timer_timeout() -> void:
	spawn_cactus()
	
func spawn_cactus():
	#print("spawn")
	var new_cactus = cactus_scene.instantiate()
	new_cactus.process_mode = Node.PROCESS_MODE_PAUSABLE
	new_cactus.position.x=1000
	new_cactus.position.y=[380,340, 300,260, 220].pick_random()  
	new_cactus.body_entered.connect(_on_cactus_body_entered)
	if score * 0.01 < 10:
		new_cactus.speed = 10 + score * 0.01
	print(new_cactus.speed)
	add_child(new_cactus)

func _on_cactus_body_entered(body: Node2D) -> void:
	if body==$dino:
		new_game()
	
func new_game():
	get_tree().paused = true
	$ScoreTimer.paused = true
	$display/TextLabel.visible=true
	if score>0:
		$dino/AnimatedSprite2D.play("gameover")
	if Input.is_action_just_pressed("jump"):
		get_tree().call_group("cactus", "queue_free")
		score = 0
		get_tree().paused = false
		$ScoreTimer.paused = false
		$display/TextLabel.visible=false
		
