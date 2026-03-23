class_name UtilRenderer
extends Control

var parent: Node
var method_name_list: Array[String]

# Base methods

func set_up(p_parent: Node, p_method_name_list: Array[String]):
	parent = p_parent
	method_name_list = p_method_name_list


func _process(_delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	if method_name_list.size() == 0:
		return
	
	for method_name in method_name_list:
		parent.call(method_name, self)
