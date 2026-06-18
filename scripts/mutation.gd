extends Node2D

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
func _process(delta: float) -> void:
	pass
