class_name Manager
extends Node

static var resource: ResourceManager
static var input: InputManager

# Public methods

func set_up():
	resource = $ResourceManager
	input = $InputManager
	
	resource.set_up()
