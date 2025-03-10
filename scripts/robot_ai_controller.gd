extends AIController3D
class_name RobotAIController

@export var raycast_sensors: Array[RayCastSensor3D]
@onready var player = get_parent() as Player

@export var chest: Chest
@export var key: Key
@export var lever: Lever
@export var raft: Raft

var mouse_movement: Vector2
var previous_mouse_movement: Vector2

var steps_without_lever_pulled: int
var should_activate_lever: float
var min_dist: float


func get_obs() -> Dictionary:
	return {}


func get_reward() -> float:
	return 0


func _physics_process(delta: float) -> void:
	return


func reset():
	return


# Defines the actions for the AI agent ("size": 2 means 2 floats for this action)
func get_action_space() -> Dictionary:
	return {}


func get_action():
	return []


func set_action(action = null) -> void:
	return


func _input(event):
	return
