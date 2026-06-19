extends AnimatedSprite2D

@onready var mutation: Node2D = $Mutation
@onready var mood: Node2D = $Mood
@onready var pathing: Node2D = $Pathing

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass # Replace with function body.

func _on_pathing_idle_state_entered() -> void:
	if mutation == null:
		return
	if mutation.mutation_state == mutation.MutationState.GEN_1:
		if animation != "gen_1_idle":
			animation = "gen_1_idle"
	elif mutation.mutation_state == mutation.MutationState.GEN_2:
		if animation != "gen_2_idle_narrow":
			animation = "gen_2_idle_narrow"
	elif mutation.mutation_state == mutation.MutationState.GEN_3:
		if animation != "gen_3_idle":
			animation = "gen_3_idle"

func _on_pathing_wander_state_entered() -> void:
	if mutation.mutation_state == mutation.MutationState.GEN_1:
		if animation != "gen_1_walk":
			animation = "gen_1_walk"
	elif mutation.mutation_state == mutation.MutationState.GEN_2:
		if animation != "gen_2_walk":
			animation = "gen_2_walk"
	elif mutation.mutation_state == mutation.MutationState.GEN_3:
		if animation != "gen_3_walk":
			animation = "gen_3_walk"
	else:
		if animation != "gen_1_walk":
			animation = "gen_1_walk"

func _on_mutation_evolving(gen: int) -> void:
	if gen == mutation.MutationState.GEN_2:
		animation = "gen_2_idle_narrow"
	elif gen == mutation.MutationState.GEN_3:
		animation = "gen_3_idle"
		