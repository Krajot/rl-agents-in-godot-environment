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
	var observations: Array[float] = []
	for raycast_sensor in raycast_sensors:
		observations.append_array(raycast_sensor.get_observation())

	var level_size = 16.0

	var chest_local = to_local(chest.global_position)
	var chest_direction = chest_local.normalized()
	var chest_distance = clampf(chest_local.length(), 0.0, level_size)
	
	var lever_local = to_local(lever.global_position)
	var lever_direction = lever_local.normalized()
	var lever_distance = clampf(lever_local.length(), 0.0, level_size)
		
	var key_local = to_local(key.global_position)
	var key_direction = key_local.normalized()
	var key_distance = clampf(key_local.length(), 0.0, level_size)
	
	var raft_local = to_local(raft.global_position)
	var raft_direction = raft_local.normalized()
	var raft_distance = clampf(raft_local.length(), 0.0, level_size)
	
	var player_speed = player.global_basis.inverse() * player.velocity.limit_length(5.0) / 5.0

	(
		observations
		.append_array(
			[
				chest_direction.x,
				chest_direction.y,
				chest_direction.z,
				chest_distance,
				lever_direction.x,
				lever_direction.y,
				lever_direction.z,
				lever_distance,
				key_direction.x,
				key_direction.y,
				key_direction.z,
				key_distance,
				raft_direction.x,
				raft_direction.y,
				raft_direction.z,
				raft_distance,
				raft.movement_direction_multiplier,
				float(player._is_lever_pulled),
				float(player._is_chest_opened),
				float(player._is_key_collected),
				float(player.is_on_floor()),
				player_speed.x,
				player_speed.y,
				player_speed.z,
			]
		)
	)
	return {"obs": observations}


func get_reward() -> float:
	return reward


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
