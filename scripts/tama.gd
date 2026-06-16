extends Node2D
@onready var tama_path: PathFollow2D = $"../.."
@onready var idle_timer: Timer = $"../IdleTimer"
var path_goal_ratio: float = 0.0
var rand_ratio_mod: int = 0
var idle_time: float = 0.0

enum MovementState {
	IDLE,
	MOVING,
}

var movement_state: int = MovementState.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() ## This method is called automatically when the project is run
	randomize_ratio_mod()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# tama_path.progress_ratio += 0.01
	
	
	pass
func randomize_ratio_mod() -> void:
	rand_ratio_mod = randi_range(0, 100)

func proceed_to_path_goal(ratio: float) -> void:
	if tama_path.progress_ratio < ratio:
		tama_path.progress_ratio += 0.01
	elif tama_path.progress_ratio > ratio:
		tama_path.progress_ratio -= 0.01
	else:
		pass

func _on_idle_timer_timeout() -> void:
	print("Idle Timer Timedout")
	pass # Replace with function body.
