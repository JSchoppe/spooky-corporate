extends Area2D
class_name GhostOne
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.animation = "dead"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D):
	#show() # Reveal the ghost after a player collision
	$AnimatedSprite2D.play("scare")
	hit.emit()


func _on_animated_sprite_2d_animation_looped():
	$AnimatedSprite2D.animation = "dead"
