extends Area2D
var player
#
#func _on_Area2D2_body_exited(body):
#	body.queue_free()
#	var new_instance = preload("res://Player.tscn")
#	player = new_instance.instance()
#	player.posit(Vector2(860,570))
#	get_tree().get_root().add_child(player)
#
#func _fixed_process(delta):
#	pass

func _on_Area2D2_body_exited(body):
	if body.is_in_group("player"):
		body.death()
