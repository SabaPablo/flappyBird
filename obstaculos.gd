extends Node2D

var speed := 150


func _ready():
	randomize()
	position.y = randf_range(-190.0,176.0)
	
func _process(delta):
	position.x -= speed * delta
	if position.x <= -350:
		call_deferred("queue_free")


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		body.die() 


func _on_score_body_entered(body):
	if(body.is_in_group("Player")):
		body.plus_score()
