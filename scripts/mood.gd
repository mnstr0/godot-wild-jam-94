extends Node2D

enum Mood {
	HAPPY,
	SAD,
	ANGRY,
	SASSY,
}

var current_mood: int = Mood.HAPPY

func set_mood(mood: int) -> void:
	if mood in Mood.values():
		current_mood = mood

func get_mood() -> int:
	return current_mood

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
