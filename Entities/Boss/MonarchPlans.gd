extends Node3D 

# Export variable to adjust rotation speed in the Inspector
@export var rotation_speed: float = 0.1

func _process(delta: float) -> void:
	# Rotate the object around the Y-axis
	rotate_y(rotation_speed * delta)
