extends RigidBody2D


export (int) var torque
export (int) var engine_thrust

export (String) var left
export (String) var right
export (String) var up

var screen_size = Vector2()
var rotation_dir = 0
var thrust = Vector2()

var controls = { 
	up = KEY_UP, 
	left = KEY_LEFT, 
	right = KEY_RIGHT, 
	a = KEY_A,
	d = KEY_D, 
	w = KEY_W 
	}

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	thrust = Vector2(0, engine_thrust)

func _integrate_forces(state):

	rotation_dir = 0
	
	#Forward
	if Input.is_key_pressed(controls[up]):
		set_applied_force(thrust.rotated(rotation))
	else:
		set_applied_force(Vector2())
	
	#Right
	if Input.is_key_pressed(controls[right]):
		rotation_dir += 1
		#set_applied_force(thrust.rotated(rotation))

	#Left
	if Input.is_key_pressed(controls[left]):
		rotation_dir -= 1
		#set_applied_force(thrust.rotated(rotation))
	
	
	set_applied_torque(rotation_dir * torque); 