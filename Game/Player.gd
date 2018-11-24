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
var is_running = false
var is_dead = false
var respawn_duration = 2
var respawn_timer = 0
var my_delta
var _initial_transform

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
	screen_size = get_viewport().get_visible_rect().size
	thrust = Vector2(0, engine_thrust)
	sprite = get_node("player_sprite")
	_initial_transform = Transform(self.get_global_transform())

func _integrate_forces(state):
	rotation_dir = 0
	#Forward
	if Input.is_key_pressed(controls[up]):
		sprite.left_flame(true)
		sprite.right_flame(true)
		set_applied_force(thrust.rotated(rotation) )
		do_jetting()
		
	else:
		sprite.left_flame(false)
		sprite.right_flame(false)
		set_applied_force(Vector2())
	#Right
	if Input.is_key_pressed(controls[right]):
		sprite.left_flame(true)
		rotation_dir += 1
		if is_running:
			$running_sprite.flip_h = false
	#Left
	if Input.is_key_pressed(controls[left]):
		sprite.right_flame(true)
		rotation_dir -= 1
		if is_running:
			$running_sprite.flip_h = true
	
	set_applied_torque(rotation_dir * torque); 

	
func _process(delta):
	check_explosion(delta)
	check_respawn(delta)
		
	
func do_running():
	if (!Input.is_key_pressed(controls[up]) and !Input.is_key_pressed(controls[left]) and !Input.is_key_pressed(controls[right])):
		$running_sprite.visible = true
		$player_sprite.visible = false
		is_running = true
		
func do_jetting():
	$running_sprite.visible = false
	$player_sprite.visible = true
		
	
func check_explosion(delta):
	if explosion_timer <= 0:
		if Input.is_key_pressed(controls[energy]):
			bounce_on = true
			explosion_timer = cooldown_time
	else:
		bounce_on = false
		explosion_timer -= delta

func get_random_number():
    randomize()
    return randi()%11
	
func death():
	$player_sprite.death()
	is_dead = true
	self.set_mode(3)
	$player_sprite.visible = false

func respawn():
	is_dead = false
	$player_sprite.visible = true
	self.set_axis_velocity(Vector2())
	self.position = Vector2(300, 300)
	#self.set_global_transform(_initial_transform)
	self.set_mode(0)
	
func check_respawn(delta):
	if is_dead:
		respawn_timer += delta
		if respawn_timer >= respawn_duration:
			print("respawn")
			respawn()
			respawn_timer = 0

		