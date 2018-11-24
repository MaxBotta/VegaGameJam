extends Area2D



func _on_Area2D_mouse_entered():
	$button.play()


func _on_button_animation_finished():
	$button.stop()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		self.get_parent().visible = false
