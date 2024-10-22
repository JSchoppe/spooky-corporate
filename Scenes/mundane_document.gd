extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed: #and event.button_index == BUTTON_LEFT:
		Gvars.CurrentMessage = "This document is too boring for me, and I work in in Accounting."
		Gvars.MessageTime = Gvars.time
