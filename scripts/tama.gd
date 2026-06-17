extends Node2D
@onready var tama_path: PathFollow2D = $"../.."
@onready var idle_timer: Timer = $"../IdleTimer"
@onready var tama_sprite: AnimatedSprite2D = $".."
var path_goal_ratio: float = 0.0
var rand_ratio_mod: int = 0
var idle_time: float = 0.0
var current_progress_ratio: float = 0.0

signal idle_state_entered
signal moving_state_entered

# enum State {STATE_IDLE, STATE_JUMP = 5, STATE_SHOOT}

# # Is the same as:
# const State = {STATE_IDLE = 0, STATE_JUMP = 5, STATE_SHOOT = 6}
# # Access values with State.STATE_IDLE, etc.

# func _ready():
# 	# Access values with Name.KEY, prints '5'
# 	print(State.STATE_JUMP)
# 	# Use dictionary methods:
# 	# prints '["STATE_IDLE", "STATE_JUMP", "STATE_SHOOT"]'
# 	print(State.keys())
# 	# prints '{ "STATE_IDLE": 0, "STATE_JUMP": 5, "STATE_SHOOT": 6 }'
# 	print(State)
# 	# prints '[0, 5, 6]'
# 	print(State.values())

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
func _process(_delta: float) -> void:
	# tama_path.progress_ratio += 0.01
	if movement_state == MovementState.IDLE:	
		if tama_sprite.animation != "gen_1_idle":
			tama_sprite.animation = "gen_1_idle"
		pass

func change_state(new_state: int) -> void:
	movement_state = new_state

func randomize_ratio_mod() -> void:
	rand_ratio_mod = randi_range(0, 100)

func proceed_to_path_goal(ratio: float) -> void:
	if tama_path.progress_ratio < ratio:
		tama_path.progress_ratio += 0.01
	elif tama_path.progress_ratio > ratio:
		tama_path.progress_ratio -= 0.01
	else:
		pass

func update_current_progress_ratio() -> void:
	current_progress_ratio = tama_path.progress_ratio

func _on_idle_timer_timeout() -> void:
	print("Idle Timer Timedout")
	change_state(1)
	emit_signal("moving_state_entered")
	pass # Replace with function body.
