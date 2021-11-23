extends KinematicBody2D
var gravity = 5
var speed = 3
var jump = 70
var velocity = Vector2.ZERO
var jumping = false
func get_input():
	var input_dir = Vector2(0,0)
	jumping = false
	if Input.is_action_pressed("forward") and is_on_floor():
		input_dir.y -= jump
		jumping = true
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir
func _physics_process(delta):
	velocity = velocity + get_input() * speed
	velocity.y = velocity.y + gravity
	if is_on_floor() and not jumping:
		velocity.y = 0
	velocity = move_and_slide(velocity,Vector2.UP)
	


func _on_Timer_timeout():
	Global.score += 1


func _on_Load_pressed():
	pass # Replace with function body.
