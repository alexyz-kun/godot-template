class_name ControllerRotatable
extends Node3D

const MOUSE_SENSITIVITY: float = 0.005

var mouse_press_anchor: Vector2

var planet_rotation: Vector2
var planet_rotation_dir: Vector2
var planet_rotation_speed: float
var drag_delta: Vector2

# Base methods

func set_up():
	SceneMain.manager.input.lmb_pressed.connect(_handle_lmb_press)
	SceneMain.manager.input.lmb_released.connect(_handle_lmb_release)


func _process(delta: float) -> void:
	_handle_rotate()


func _input(event: InputEvent) -> void:
	pass


# Private methods

func _handle_lmb_press():
	mouse_press_anchor = get_viewport().get_mouse_position()


func _handle_rotate():
	if !SceneMain.manager.input.lmb_is_held:
		return
	
	var curr_mouse_pos: Vector2 = get_viewport().get_mouse_position()
	drag_delta = 0.01 * (mouse_press_anchor - curr_mouse_pos)
	var rotation_delta: Vector2 = planet_rotation + drag_delta
	
	transform.basis = Basis()
	rotate_object_local(Vector3.UP, -rotation_delta.x)
	rotate_object_local(Vector3.RIGHT, -rotation_delta.y)


func _handle_lmb_release():
	planet_rotation += drag_delta
	drag_delta = Vector2.ZERO
	print(planet_rotation)
