class_name Manager
extends Node

static var resource: ResourceManager

# Public methods

func set_up():
	resource = $ResourceManager
	resource.set_up()
