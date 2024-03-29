extends KinematicBody2D

var motion = Vector2(0,0)
var lives = 3

const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 5000
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.5

signal animate

func _physics_process(delta):
	
	apply_gravity()
	jump()
	move()
	animate()
	
	move_and_slide(motion, UP)


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left") :
		motion.x = SPEED
	else:
		motion.x = 0


func jump():
	if Input.is_action_pressed("Space") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()
		
func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState","end_game")	
#		end_game()
	elif is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY


func animate():
	emit_signal("animate",motion)

	
func hurt():
	position.y -= 1
	yield(get_tree(),"idle_frame")
	motion.y -= JUMP_SPEED
	$PainSFX.play()
	
		
func boost():
	position.y -= 1
	yield(get_tree(),"idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER