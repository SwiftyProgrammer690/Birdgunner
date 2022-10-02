extends KinematicBody2D

var health = 10
var motion = Vector2()
var is_time_to_shoot = false
var bullet_speed = 500
var bullet = preload("res://EnemyBullet.tscn")

func fire():
	is_time_to_shoot = true
	
	if is_time_to_shoot:
		is_time_to_shoot = false
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees 
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child", bullet_instance)

func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position)/170
	look_at(Player.position)
	
	if Input.is_action_pressed("Shoot"):
		yield(get_tree().create_timer(3.0), "timeout")
		fire()
	
	move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		health -= 1
		if health == 0:
			queue_free()

