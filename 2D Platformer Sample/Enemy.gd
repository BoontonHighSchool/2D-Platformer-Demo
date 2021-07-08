extends Area2D

var enemy_types = ["Bat", "Spider", "Ghost", "Worm"]

func _ready():
	set_process(true)
	randomize()
	$AnimatedSprite.animation = enemy_types[randi() % enemy_types.size()]





func _on_Enemy_body_entered(body):
	if body.name == "Player":
		Global.Health -= 10
