extends Node2D
@onready var tama_path: PathFollow2D = $"../.."
@onready var idle_timer: Timer = $"../IdleTimer"
@onready var tama_sprite: AnimatedSprite2D = $".."
# var path_goal_ratio: float = 0.0
var rand_ratio_mod: int = 0
var idle_time: float = 0.0
var path_goal_ratio: float = 0.0
var moving_right: bool = true
var current_ratio: float
var delta: float
var step: float = 0.001

@export var idle_timeout : float

signal idle_state_entered
signal wander_state_entered
signal moving_state_entered

enum MovementState {
	IDLE,
	WANDER,
	MOVING,
}

var movement_state: int = MovementState.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emit_signal("idle_state_entered")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# tama_path.progress_ratio += 0.01
	if movement_state == MovementState.IDLE:
		pass
	elif movement_state == MovementState.WANDER:
		if path_goal_ratio != tama_path.progress_ratio:
			proceed_to_path_goal(path_goal_ratio)
		pass

func randomize_ratio_mod() -> void:
	rand_ratio_mod = randi_range(0, 100)

func proceed_to_path_goal(ratio: float) -> void:
	# Get the current position along the path as a ratio from 0 to 1.
	current_ratio = tama_path.progress_ratio
	# Calculate how far away the target ratio is from the current position.
	delta = ratio - current_ratio

	# If we are very close to the target, snap to it and stop moving.
	if abs(delta) <= step:
		tama_path.progress_ratio = ratio
		movement_state = MovementState.IDLE
		emit_signal("idle_state_entered")
		idle_timer.start(idle_timeout)

	elif delta > 0:
		# If the target is ahead of the current position, move forward.
		tama_path.progress_ratio += step
	else:
		# If the target is behind the current position, move backward.
		tama_path.progress_ratio -= step

func update_path_goal_ratio() -> void:
	path_goal_ratio = tama_path.progress_ratio + rand_ratio_mod
	if path_goal_ratio > 100:
		path_goal_ratio -= 100
	path_goal_ratio /= 100 # ratio is between 0 and 1
	path_goal_ratio = round(path_goal_ratio * 100) / 100.0

func _on_idle_timer_timeout() -> void:
	print("Idle Timer Timedout")
	randomize_ratio_mod()
	update_path_goal_ratio()
	movement_state = MovementState.WANDER
	if path_goal_ratio < tama_path.progress_ratio && tama_sprite.flip_h == false:
		tama_sprite.flip_h = true
	elif path_goal_ratio > tama_path.progress_ratio && tama_sprite.flip_h == true:
		tama_sprite.flip_h = false
	emit_signal("wander_state_entered")
	print("New Path Goal Ratio: ", path_goal_ratio)
	pass # Replace with function body.
