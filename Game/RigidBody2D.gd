extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (float) var rotation_speed = 5
#export (float) var scaling = 2
#export (Vector2) var scale


func _ready():
	
	#get_node("CollisionShape2D").get_transform().scaled(Vector2(scaling, scaling))
	#get_node("Area2D/CollisionShape2D").get_transform().scaled(Vector2(scaling, scaling))
	#get_node("Sprite").get_transform().scaled(Vector2(scaling*0.2, scaling*0.2))
	pass

func _process(delta):
	self.rotation += rotation_speed * delta




func _on_Area2D2_body_entered(body):
	if(body.is_in_group("player")):
		body.do_running()
