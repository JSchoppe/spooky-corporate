extends Area2D

var on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OnSprite2D.visible = false
	$OnSprite2D.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Gvars.ElevatorOn:
		$OffSprite2D.visible = true
		$OnSprite2D.visible = false
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed: #and event.button_index == BUTTON_LEFT:
		if on:
			Gvars.CurrentMessage = "Looks like the elevator is back on!"
		else:
			Gvars.CurrentMessage = "The elevators are shut down for the night."
		Gvars.MessageTime = Gvars.time	
