class_name ExampleCamera
extends Camera3D

enum CameraMode {
	IDLE,
	FREE_ROAM,
	ORBIT_PLAYER,
}

const ORIGIN: Vector3 = Vector3.ZERO

var distance: float = 0.0
var altitude: float = 0.0
var angle: float = 0.0

# Base methods

func _ready() -> void:
	distance = (global_position - ORIGIN).length()
	altitude = global_position.y


func _process(delta: float) -> void:
	revolve(delta)


# Private methods

func revolve(delta: float):
	angle += 0.2 * PI * delta
	global_position = distance * Vector3(cos(angle), altitude, sin(angle))
	look_at(ORIGIN)
