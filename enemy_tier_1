extends KinematicBody2D

var health = 3
var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position)/55
	look_at(Player.position)
	
	move_and_collide(motion)
	



func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		health -= 1
		if health == 0:
			queue_free()
