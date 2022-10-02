extends KinematicBody2D

var speed = 170
var health = 7
var contact_health = 3

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("Up"):
		motion.y -= 1
	if Input.is_action_pressed("Down"):
		motion.y += 1
	if Input.is_action_pressed("Left"):
		motion.x -= 1
	if Input.is_action_pressed("Right"):
		motion.x += 1
		
	motion = motion.normalized()
	motion = move_and_slide(motion * speed)


func _on_Area2D_body_entered(body):
	if "EB" in body.name:
		health -= 1
		if health == 0:
			get_tree().change_scene("res://Menu.tscn")
	if "Enemy" in body.name:
		contact_health -= 1
		if contact_health == 0:
			get_tree().change_scene("res://Menu.tscn")
