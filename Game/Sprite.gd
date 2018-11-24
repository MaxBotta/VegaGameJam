extends Sprite

export (bool) var flame_left_on = false
export (bool) var flame_right_on = false

var left_flame_sprite
var right_flame_sprite
var death_sprite
var parent

func _ready():
	left_flame_sprite = get_node("flame_left")
	right_flame_sprite = get_node("flame_right")
	death_sprite = get_node("../death")
	parent = get_parent()
	right_flame(false)
	left_flame(false)


#func _process(delta):
#	if flame_left_on:
#		left_flame_sprite.playing = true
#	if flame_right_on:
#		right_flame_sprite.playing = true
#

func right_flame(mode):
	#right_flame_sprite.playing = mode
	right_flame_sprite.visible = mode
	
func left_flame(mode):
	#left_flame_sprite.playing = mode
	left_flame_sprite.visible = mode
	
func death():
	death_sprite.visible = true
	self.visible = false
	death_sprite.play()
	parent.death()

func _on_death_animation_finished():
	self.visible = true
	death_sprite.visible = false
	death_sprite.stop()
	parent.respawn()
