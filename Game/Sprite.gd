extends Sprite

export (bool) var flame_left_on = false
export (bool) var flame_right_on = false
#
#var left_flame_sprite
#var right_flame_sprite
#
#func _ready():
#	left_flame_sprite = get_node("flame_left")
#	right_flame_sprite = get_node("flame_right")
#	left_flame_sprite.playing = false
#	right_flame_sprite.playing = false
#
#
#func _process(delta):
#	if flame_left_on:
#		left_flame_sprite.playing = true
#	if flame_right_on:
#		right_flame_sprite.playing = true
#