extends Node2D

var Obstaclo = preload("res://obstaculos.tscn")



func _on_obstacle_timer_timeout():
	var obstaculo = Obstaclo.instantiate()
	obstaculo.position.x = 270
	add_child(obstaculo)
