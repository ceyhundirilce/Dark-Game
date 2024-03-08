extends KinematicBody2D

var speed=10
var motion= Vector2.ZERO

var path:Array=[]
var NavigationNode=null
var player=null

var follow_the_player=true

var door=false

func _ready():
	if get_tree().has_group("Navigation"):
		NavigationNode=get_tree().get_nodes_in_group("Navigation")[0]
	if get_tree().has_group("Player"):
		player=get_tree().get_nodes_in_group("Player")[0]
		
func _process(delta):
	if follow_the_player==true:
		create_path()
		goto()
	
	if door==false:
		if player.position.y < $".".position.y:$".".z_index = 5
		else:$".".z_index = 4
	
func create_path():
	if NavigationNode!=null and player!= null:
		path=NavigationNode.get_simple_path(global_position,player.global_position,false)
		
func goto():
	if path.size()>0:
		motion=global_position.direction_to(path[1])*speed
		motion=move_and_slide(motion)
		if motion.x > 0:$Sprite.flip_h=true
		elif motion.x < 0:$Sprite.flip_h=false

func _on_HitAnimationArea_area_entered(area):
	if area.is_in_group("PlayerArea"):
		follow_the_player=false

func _on_HitAnimationArea_area_exited(area):
	if area.is_in_group("PlayerArea"):
		follow_the_player=true

func _on_DoorZ_index_area_entered(area):
	if area.is_in_group("Z_index"):
		z_index=2
		door=true

func _on_DoorZ_index_area_exited(area):
	if area.is_in_group("Z_index"):
		z_index=3
		door=false
