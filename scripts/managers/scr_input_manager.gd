class_name InputManager
extends Node

signal primary_event

# Base methods

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_LEFT:
				primary_event.emit(true)
		if event.is_released():
			if event.button_index == MOUSE_BUTTON_LEFT:
				primary_event.emit(false)
	pass
