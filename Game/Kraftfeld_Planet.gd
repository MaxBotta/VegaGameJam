extends Area2D


var target = Vector2()
var velocity = Vector2()
var players = []
var planet_rotation
var direction

func _ready():
	pass
	


func _on_Area2D_body_entered(body):
	if(body.is_in_group("player")):
		players.push_back(body)
		


func _physics_process(delta):
	for player in players:
		target = self.get_global_transform().get_origin()

		direction = (target - player.get_global_transform().get_origin()).normalized() 
		var baum = player.get_global_transform().orthonormalized()

		var to_rotate = baum.x.dot(direction) * -1
#		to_rotate = clamp(to_rotate, 0, 0.005)
		player.rotate(to_rotate)

		velocity = direction * 200
		player.set_applied_force(velocity)

		
