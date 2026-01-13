class_name SceneExample
extends Node3D

var camera: Camera3D
var first_person: ControllerFirstPerson
var third_person: ControllerThirdPerson
var planet: ControllerRotatable

# Base methods

func _ready() -> void:
	pass


# Public methods

func on_scene_active() ->  void:
	camera = $Node3D/Camera3D
	first_person = $Node3D/FirstPerson
	third_person = $Node3D/ThirdPerson
	planet = $Node3D/Planet
	
	# first_person.attach_camera(camera)
	third_person.attach_camera(camera)
	# attach_camera_to_planet()


# Private methods

func attach_camera_to_planet():
	camera.global_position = planet.global_position - 2 * Vector3.FORWARD
	camera.look_at(planet.global_position)
