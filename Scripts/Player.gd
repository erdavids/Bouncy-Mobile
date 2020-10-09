extends RigidBody2D

var first_touch
var release

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("Click")):
		first_touch = get_global_mouse_position()
	if (Input.is_action_just_released("Click")):
		release  = get_global_mouse_position()
		
		var dir = -(release - first_touch).normalized()
		
		linear_velocity = dir * delta * 90000
		
