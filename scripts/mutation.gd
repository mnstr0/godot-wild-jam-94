extends Node2D

@onready var idle_timer: Timer = $"../IdleTimer"
@onready var pathing: Node2D = $"../Pathing"

var mutating : bool = false
var mutation_XP : int = 0
var mutation_XP_threshold : int = 10

signal evolving

enum MutationState {
	GEN_1,
	GEN_2,
	GEN_3,
}

var mutation_state: int = MutationState.GEN_1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func increase_mutation_XP() -> void:
	mutation_XP += 1
	if mutation_XP >= mutation_XP_threshold:
		mutation_XP = 0
		if mutation_state < MutationState.GEN_3:
			mutation_state += 1
			emit_signal("evolving", mutation_state)
			idle_timer.stop()
			idle_timer.start(pathing.idle_timeout)
			pathing.movement_state = pathing.MovementState.IDLE
			print("Tama evolved to generation %d!" % mutation_state)
	print("Mutation XP: %d / %d" % [mutation_XP, mutation_XP_threshold])