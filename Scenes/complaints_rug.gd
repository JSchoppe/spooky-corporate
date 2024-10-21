extends Area2D
class_name ComplaintsRug

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		var msg1 = "There's a sign on the wall, but management wanted a rug to be more visible from above."
		var msg2 = "Lots of people work in Complaints.  They always seem exhausted."
		Gvars.CurrentMessage = "There's a sign on the wall, but management wanted a rug to be more visible from above."
		Gvars.MessageTime = Gvars.time
