extends RigidBody2D

@onready var collider: CollisionShape2D = $CollisionShape2D
var mouse_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	if Input.is_action_pressed("left_click"):
		mouse_pos = get_global_mouse_position()
		if collider.shape.get_rect().has_point(to_local(mouse_pos)):
			despawn_food()


func despawn_food() -> void:
	queue_free()

