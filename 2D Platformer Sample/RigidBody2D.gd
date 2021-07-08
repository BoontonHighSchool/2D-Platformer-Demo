extends RigidBody2D

var enemy_types = ["Bat", "Spider"]

func _ready():
	set_process(true)
	randomize()
	$AnimatedSprite.animation = enemy_types[randi() % enemy_types.size()]


