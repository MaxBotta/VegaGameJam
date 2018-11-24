extends Area2D


var target = Vector2()
var velocity = Vector2()
var players = []
var planet_rotation
var direction

func _ready():
	pass
	


func _on_Area2D_body_entered(body):
	print("entered: ", body)
	if(body.is_in_group("player")):
		print("is player")
		#body.linear_velocity = Vector2()
		body.bounce = false
		players.push_back(body)
		


func _physics_process(delta):
	for player in players:
		target = self.get_global_transform().get_origin()

		direction = (target - player.get_global_transform().get_origin()).normalized() 
		var baum = player.get_global_transform().orthonormalized()

		var to_rotate = baum.x.dot(direction) 
#		to_rotate = clamp(to_rotate, 0, 0.005)
		player.rotate(to_rotate)

		velocity = direction * 300
		player.set_applied_force(velocity)

		


func _on_Area2D_body_exited(body):
	print("left: ", body)
	if(body.is_in_group("player")):
		#body.bounce_on = true
		var erg = players.find(body)
		if(erg != -1):
			players.remove(erg)
		
	
