extends Area2D
class_name iCorn
signal candy_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_body_entered(body: Node2D) -> void:
	#if body is player and is_visible():
	#	hide()
	#	Gvars.iCorn = Gvars.iCorn + 1
	#	candy_hit.emit()
