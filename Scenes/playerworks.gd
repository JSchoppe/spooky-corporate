extends CharacterBody2D
class_name player


#export allows us to set the speed value in the inspector
@export var speed = 700
@export var pause_menu: PauseMenu # Pause menu to use.
@export var step_audio_cooldown: float = 1.0
var screen_size # Size of the game window.
var dying = false
var deadtime = 0
var spawnx = 4000
var spawny = 1000
var current_step_audio_cooldown: float = 0.0


#func start(pos):
	#position = pos
	#show()
	#$AnimatedSprite2D.play()
	#$CollisionShape2D.disabled = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#the above line doesn't seem to do anything.  I need to use the project settings to set the window to something reasonable.
	#position = pos
	show()
	$AnimatedSprite2D.play()
	$PhoneVideo1.play()
	$iWedge.play()
	$iCorn.play()
	$CollisionShape2D.disabled = false #This might not do anything
	#hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		Gvars.inventorytime = Gvars.time
		$Pocket.visible = true
		if Gvars.iWedge>0:
			$iWedge.visible = true
		if Gvars.iSharonKey>0:
			$iSharonKey.visible = true
		if Gvars.iCorn>0:
			$iCorn.visible = true
	if (Gvars.time - Gvars.phonetime > 300):
		$Phone.visible = false
		$PhoneVideo1.visible = false
		Gvars.phonetime = Gvars.time
	if (Gvars.time - Gvars.inventorytime > 200):
		$Pocket.visible = false
		$iWedge.visible = false
		$iSharonKey.visible = false
		$iCorn.visible = false
		Gvars.phonetime = Gvars.time
func _physics_process(delta: float) -> void:
	current_step_audio_cooldown -= delta
	
	if pause_menu.is_paused:
		if Input.is_action_just_pressed("pause"):
			pause_menu.unpause()
	else:
		if Input.is_action_just_pressed("pause"):
			pause_menu.pause()
		if dying:
			if (Gvars.time - deadtime > 420):
				dying = false
				position.x = spawnx
				position.y = spawny
				$AnimatedSprite2D.animation = "idle"
				pass#respawn here
		else:
			var velocity = Vector2.ZERO # The player's movement vector.
			if Input.is_action_pressed("move_right"):
				velocity.x += 1
			if Input.is_action_pressed("move_left"):
				velocity.x -= 1
			if Input.is_action_pressed("move_down"):
				velocity.y += 1
			if Input.is_action_pressed("move_up"):
				velocity.y -= 1

			if velocity.length() > 0:
				velocity = velocity.normalized() * speed
				$AnimatedSprite2D.play()
				$AnimatedSprite2D.animation = "walk"
				$AnimatedSprite2D.flip_h = velocity.x > 0
				if current_step_audio_cooldown <= 0.0:
					$"Footsteps Audio Player".play()
					current_step_audio_cooldown = step_audio_cooldown
				
			else:
				$AnimatedSprite2D.animation = "idle"
			
			position += velocity * delta
			move_and_slide()
		
	Gvars.px = position.x
	Gvars.py = position.y


func _on_body_entered(body):
	pass
	#hide() # Player disappears after being hit.
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)

# Pausing/unpausing functionality.
func _pause():
	# TODO pause controls/time here
	# Show the pause menu, when the menu is exited call _unpause.
	pause_menu.show_pause(_unpause)
func _unpause():
	# TODO unpause controls/time here
	pass

# Called when an area is entered by the player shape.
func _on_area_entered(area: Area2D) -> void:
	if area is HauntedProp:
		_start_death_sequence()
	if area is CopyMonsterHurtZone:
		_start_death_sequence()
	if area is WedgeItem:
		Gvars.iWedge =  Gvars.iWedge + 1
		area.position.x = 1000000
		Gvars.CurrentMessage = "This door stop might come in handy."
		Gvars.MessageTime = Gvars.time
	if area is SharonKeyItem:
		Gvars.iSharonKey = Gvars.iSharonKey+1
		area.position.x = 1000000
		Gvars.CurrentMessage = "I've always wondered what was in Sharon's office."
		Gvars.MessageTime = Gvars.time
	if area is SharonDoorTrigger:
		if Gvars.iSharonKey > 0:
			Gvars.NeedToOpenSharonDoor = true #Door is opened in main node script
	if area is TimeCamTrigger1:
		$Phone.visible = true
		$PhoneVideo1.visible = true
		Gvars.phonetime = Gvars.time
	if area is GhostOne:
		_start_death_sequence()
func _start_death_sequence():
	$AnimatedSprite2D.animation = "dying"
	dying = true
	deadtime = Gvars.time
	$Deathsound.play()
	# For now just hide the player.
	#hide()


func _on_animated_sprite_2d_animation_looped():
	if dying:
		$AnimatedSprite2D.animation = "dead"	
		pass
