extends Area2D

var timer = 0
var shrink = true
var scale_value = 0.01
var duration_value = 0.4
var death_position
	
func _process(delta):
	flickering(delta)

func _on_Area2D_body_entered(body):
	if body.is_dead == false:
		body.get_node("player_sprite").death()

func flickering(delta):
	if timer <= 0:
		timer = duration_value
		shrink = !shrink
	else:
		timer -= delta
		
	if shrink:
		self.scale.x -= scale_value
	else:
		self.scale.x += scale_value
	