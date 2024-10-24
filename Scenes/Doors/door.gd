extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$image.animation = "closed"




# macro's to open and close a door	
func close_door():
	$image.animation = "closed"




func open_door():
	$image.animation = "open"
	$"Door Opened Audio Player".play()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_body_entered(body: Node2D) -> void:
	open_door()




func _on_body_exited(body: Node2D) -> void:
	close_door()
