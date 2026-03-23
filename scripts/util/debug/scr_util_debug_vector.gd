class_name UtilDebugVector
extends Control

var viewport: Viewport
var camera: Camera3D
var head: Vector3
var tail: Vector3

# Base methods

func set_up(p_viewport: Viewport, p_camera: Camera3D, p_head: Vector3, p_tail: Vector3):
	viewport = p_viewport
	camera = p_camera
	head = p_head
	tail = p_tail


func _process(delta: float) -> void:
	if viewport and camera and head and tail:
		queue_redraw()


func _draw() -> void:
	const RADIUS: float = 16.0
	
	var head_spos: Vector2 = camera.unproject_position(head)
	var tail_spos: Vector2 = camera.unproject_position(tail)
	var vector_dir: Vector2 = (head_spos - tail_spos).normalized()
	
	var dist_cam_to_head: float = (head - camera.global_position).length()
	var dist_cam_to_tail: float = (tail - camera.global_position).length()
	
	# Head sides
	var p1: Vector2 = head_spos + (RADIUS / dist_cam_to_head) * vector_dir.rotated(-0.5 * PI)
	var p4: Vector2 = head_spos + (RADIUS / dist_cam_to_head) * vector_dir.rotated( 0.5 * PI)
	# Tail sides
	var p2: Vector2 = tail_spos + (RADIUS / dist_cam_to_tail) * vector_dir.rotated(-0.5 * PI)
	var p3: Vector2 = tail_spos + (RADIUS / dist_cam_to_tail) * vector_dir.rotated( 0.5 * PI)
	
	var uv1 := Vector2(0, 0)
	var uv2 := Vector2(1, 0)
	var uv3 := Vector2(1, 1)
	var uv4 := Vector2(0, 1)
	
	draw_primitive(
		[p1, p2, p3, p4],
		[Color.RED, Color.YELLOW, Color.YELLOW, Color.RED],
		[uv1, uv2, uv3, uv4])
	
	if !camera.is_position_behind(head):
		draw_circle(head_spos, RADIUS / dist_cam_to_head, Color.RED)
	if !camera.is_position_behind(tail):
		draw_circle(tail_spos, RADIUS / dist_cam_to_tail, Color.YELLOW)
