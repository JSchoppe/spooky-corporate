extends StaticBody2D
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#y u no work
	#print("itried")
	if event is InputEventMouseButton and event.pressed: #and event.button_index == BUTTON_LEFT:
		var msg1 = "The conference table is impossibly shiny.  Better not leave any fingerprints."
		var msg2 = "How did they even get this thing in here?"
		var msg3 = "It's so long I can't even see the other end!"
		var messages = [msg1,msg2,msg3]
		var themessage = messages[rng.randi_range(0,2)]
		Gvars.CurrentMessage = themessage
		Gvars.MessageTime = Gvars.time
