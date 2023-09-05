extends Sprite2D

var motion:Vector2 = Vector2(randf()*2-1, randf()*2-1)
var controller

func _process(delta):
	position += motion.normalized()*delta*250
	if position.x<0: motion.x = abs(motion.x)
	if position.y<0: motion.y = abs(motion.y)
	if position.x>G.view_size.x: motion.x = -abs(motion.x)
	if position.y>G.view_size.y: motion.y = -abs(motion.y)
