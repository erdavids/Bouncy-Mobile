extends RigidBody2D

var first_touch
var release

export var bounce_limit = 7

var number_of_bounces = 0

var debug = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("Click")):
		first_touch = get_global_mouse_position()
	if (Input.is_action_just_released("Click")):
		release  = get_global_mouse_position()
		
		var dir = -(release - first_touch).normalized()
		
		linear_velocity = dir * delta * 90000
		

func _on_Player_body_entered(body):
	number_of_bounces += 1
	$Particles2D.emitting = true
	
	
	if (number_of_bounces > bounce_limit and debug == false):
		get_parent().remove_child(self)
		queue_free()
