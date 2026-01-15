class_name ControllerRotatable
extends Node3D

const MOUSE_SENSITIVITY: float = 0.005

var planet_rotation: Vector2
var target_rotation: Vector2

# Base methods

func _process(delta: float) -> void:
	_smooth_out_rotation(delta)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_handle_drag(event)


# Private methods

func _handle_drag(event: InputEventMouseMotion):
	if !SceneMain.manager.input.lmb_is_held:
		return
	
	target_rotation += MOUSE_SENSITIVITY * event.relative


func _smooth_out_rotation(delta: float):
	planet_rotation = UtilMath.delta_lerp_vec2(planet_rotation, target_rotation, 16, delta)
	
	var delta_rotation: Vector2 = target_rotation - planet_rotation
	rotate(Vector3.UP, delta_rotation.x)
	rotate(Vector3.RIGHT, delta_rotation.y)
