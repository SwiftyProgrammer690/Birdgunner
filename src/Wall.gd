extends StaticBody2D

func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
	if "EB" in body.name:
		queue_free()
