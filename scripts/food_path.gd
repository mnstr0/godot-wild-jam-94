extends PathFollow2D

@onready var food: RigidBody2D = preload("res://scenes/food.tscn").instantiate()
## constantly increase the path ratio
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta * 0.1

func spawn_food() -> void:
	var food_instance = food.duplicate()
	food_instance.position = position
	get_parent().add_child(food_instance)
	print("Food spawned at: ", position)