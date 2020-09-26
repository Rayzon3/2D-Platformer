extends KinematicBody2D

const UP = Vector2(0, -1)
const Gravity = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80
const JUMPFORCE = 300
const ACCEL = 10 

var motion = Vector2()
var facing_right = true

func _ready():
	pass 

func _physics_process(delta):
	
	motion.y += Gravity
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("run")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$AnimationPlayer.play("run")
	elif Input.is_action_pressed("attack-1"):
		$AnimationPlayer.play("attack-1")
		
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	if !is_on_floor():
		if motion.y < 0:
			$AnimationPlayer.play("jump")
	
	motion = move_and_slide(motion,UP)
	

