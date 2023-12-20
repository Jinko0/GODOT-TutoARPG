extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer
var direction: String = "Down"

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func UpdateAnimations():
	if velocity.length() == 0 && animations.is_playing():
		animations.stop()
	else:
		if velocity.y < 0: direction = "Up"
		elif velocity.y > 0: direction = "Down"
		elif velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		
		animations.play("walk" + direction)

func _physics_process(delta):
	handleInput()
	move_and_slide()
	UpdateAnimations()
