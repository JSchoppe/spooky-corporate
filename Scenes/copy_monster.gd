extends CharacterBody2D


const speed = 150.0
var xvel = 0
var yvel = 0
var rng = RandomNumberGenerator.new()

func _physics_process(delta: float) -> void:
	
	
	if Gvars.time%37==1:
		xvel = 2*rng.randf()-1
		yvel = 2*rng.randf()-1
		if (rng.randf()>0.5):
			xvel = Gvars.px-position.x#todo difference in x position player to monster 
			yvel = Gvars.py-position.y#todo difference in y position player to monster
	velocity.x = xvel
	velocity.y = yvel
	#print(xvel)
	#print(yvel)
	#print(".")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		#$copysound.play()
		#$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_h = velocity.x > 0
	#else:
		#$AnimatedSprite2D.animation = "idle"
	
	position += velocity * delta
	move_and_slide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed: #and event.button_index == BUTTON_LEFT:
		Gvars.CurrentMessage = "Mr. Epson is in a mood, I better stay away"
		Gvars.MessageTime = Gvars.time
	 #queue_free()
