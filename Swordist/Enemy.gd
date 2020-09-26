extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	pass 

func _on_SwordHitArea_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage()
		$AnimationPlayer.play("death")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
