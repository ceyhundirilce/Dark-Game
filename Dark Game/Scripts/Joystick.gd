extends Control

var start_pos: Vector2 = Vector2.ZERO
var end_pos: Vector2 = Vector2.ZERO

onready var big_circle=$Area2D/BigCircle
onready var small_circle=$Area2D/BigCircle/SmallCircle

onready var max_distance=$Area2D/CollisionShape2D.shape.radius

var touched=false

export (float,0,1.0) var friction=1

func _input(event):
	if event is InputEventScreenTouch:
		var distance=event.position.distance_to(big_circle.global_position)
		if not touched:
			if distance<max_distance:
				touched=true
		else:
			small_circle.position=Vector2.ZERO
			touched=false

func _process(delta):
	if touched:
		small_circle.global_position=get_global_mouse_position()
		small_circle.position=big_circle.position+(small_circle.position-big_circle.position).clamped(max_distance)
		
func get_velo():
	var joy_velo=Vector2.ZERO
	joy_velo.x=small_circle.position.x/max_distance
	joy_velo.y=small_circle.position.y/max_distance
	return joy_velo
