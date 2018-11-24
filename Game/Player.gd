extends RigidBody2D


export (int) var torque
export (int) var engine_thrust

export (String) var left
export (String) var right
export (String) var up
export (String) var energy
export (bool) var bounce_on = false
export (int) var bounce_power
export (int) var cooldown_time

var screen_size = Vector2()
var rotation_dir = 0
var thrust = Vector2()
var explosion_timer = 0
var sprite

var controls = { 
	up = KEY_UP, 
	left = KEY_LEFT, 
	right = KEY_RIGHT, 
	a = KEY_A,
	d = KEY_D, 
	w = KEY_W,
	space = KEY_SPACE,
	p = KEY_P 
	}

func _ready():
	self
	screen_size = get_viewport().get_visible_rect().size
	thrust = Vector2(0, engine_thrust)
	sprite = get_node("player_sprite")

func _integrate_forces(state):
	rotation_dir = 0
	#Forward
	if Input.is_key_pressed(controls[up]):
		sprite.left_flame(true)
		sprite.right_flame(true)
		set_applied_force(thrust.rotated(rotation))
	else:
		sprite.left_flame(false)
		sprite.right_flame(false)
		set_applied_force(Vector2())
	#Right
	if Input.is_key_pressed(controls[right]):
		sprite.left_flame(true)
		rotation_dir += 1
	#Left
	if Input.is_key_pressed(controls[left]):
		sprite.right_flame(true)
		rotation_dir -= 1
	
	
	set_applied_torque(rotation_dir * torque); 
	
func _process(delta):
	check_explosion(delta)

func check_explosion(delta):
	print(explosion_timer)
	if explosion_timer <= 0:
		if Input.is_key_pressed(controls[energy]):
			bounce_on = true
			explosion_timer = cooldown_time
	else:
		bounce_on = false
		explosion_timer -= delta
		
	
		
		
		
		
		
		
		
		