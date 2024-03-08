extends KinematicBody2D

onready var BigCircle = $Controls/Joystick/Area2D/BigCircle
onready var SmallCircle = $Controls/Joystick/Area2D/BigCircle/SmallCircle

var velocity=Vector2.ZERO

export var speed=30

func _process(delta):
	velocity=$Controls/Joystick.get_velo()
	move_and_slide(velocity*speed,Vector2.UP)
	if $Controls/Joystick/Area2D/BigCircle/SmallCircle.position.x<0:$Sprite.flip_h=true
	elif $Controls/Joystick/Area2D/BigCircle/SmallCircle.position.x>0:$Sprite.flip_h=false

func _on_EnemyArea_area_entered(area):
	if area.is_in_group("EnemyArea"):
		pass

func _on_DoorZ_index_area_entered(area):
	if area.is_in_group("Z_index"):
		z_index=2
		
func _on_DoorZ_index_area_exited(area):
	if area.is_in_group("Z_index"):
		z_index=5
