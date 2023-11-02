extends RigidBody2D


var speed := 400
var score := 0

func _integrate_forces(state):
	if Input.is_action_just_pressed("ui_accept"):
		$FlapAudioStreamPlayer.play()
		linear_velocity = Vector2.ZERO
		apply_central_impulse(Vector2(0,-speed))
		$AnimatedSprite2D.play("flap")
		

func die():
	$HitAudioStreamPlayer.play()
	get_tree().paused = true
	$"../Message".show()
	$"../Message/Gameover".show()

func plus_score():
	$PointAudioStreamPlayer.play()
	score += 1
	$"../ScoreLabel".text = str(score)


func _on_floor_detected_body_entered(body):
	if body.is_in_group("Obstaculo"):
		die()
