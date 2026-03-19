class_name ExampleCamera
extends Camera3D

enum CameraMode {
	ORBIT,
	FIRST_PERSON,
	THIRD_PERSON,
}

const ORIGIN: Vector3 = Vector3.ZERO

var distance: float = 0.0
var altitude: float = 0.0
var angle: float = 0.0

# Base methods

func _ready() -> void:
	distance = (global_position - ORIGIN).length()
	altitude = global_position.y


func _process(p_delta: float) -> void:
	pass
	# revolve(p_delta)


# Private methods

func revolve(p_delta: float):
	angle += 0.2 * PI * p_delta
	global_position = distance * Vector3(cos(angle), altitude, sin(angle))
	look_at(ORIGIN)
