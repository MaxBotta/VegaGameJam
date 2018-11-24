extends Area2D

export (float) var game_time
var shrink_factor = 0.0001
var screen_size

func _ready():
	screen_size = get_viewport().get_visible_rect().size

func _process(delta):
	scale_down()
	
func _on_Area2D_body_entered(body):
	if body.is_dead == false:
		body.is_dead = true
		body.get_node("player_sprite").death()
		death_position = body.get_position()
		body.mode = 1
		#body.queue_free()

func scale_down():
	self.scale.x -= shrink_factor
	self.scale.y -= shrink_factor