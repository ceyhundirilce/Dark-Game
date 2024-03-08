extends StaticBody2D

var doorKey=0
var doorActive=0

func _process(delta):
	if doorKey==1:
		$Sprite.texture=load("res://Items/DoorOpen.png")
		$MainCollision.queue_free()
		$LightOccluder2D.queue_free()
		$DoorLock.queue_free()
		doorKey=0
		doorActive=1

func _on_DoorLock_body_entered(body):
	if body.name=="Player":
		doorKey=1

func _on_Z_index_area_entered(area):
	if area.is_in_group("DoorZ_index") and doorActive==0:
		$Sprite.modulate="96ffffff"

func _on_Z_index_area_exited(area):
	if area.is_in_group("DoorZ_index") and doorActive==0:
		$Sprite.modulate="ffffff"
