extends Area2D

var item_types = ["Red", "Green", "Blue", "Yellow", "Wild"]

func _ready():
	set_process(true)
	randomize()
	$AnimatedSprite.animation = item_types[randi() % item_types.size()]


func _on_Item_body_entered(body):
	if body.name == "Player":
		if $AnimatedSprite.animation == "Red":
			Global.Health += 10
		elif $AnimatedSprite.animation == "Green":
			Global.Health += 5
		elif $AnimatedSprite.animation == "Blue":
			Global.Health += 15
		elif $AnimatedSprite.animation == "Yellow":
			Global.Health += 20
		else:
			$AnimatedSprite.animation == "Wild"
			Global.Health += randi()%20+1
		queue_free()


