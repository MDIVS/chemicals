extends Sprite2D

const ELECTRON_INFLUENCE_DISTANCE:float = 1000
const PROTON_INFLUENCE_DISTANCE:float = 100

var motion:Vector2 = Vector2(randf()*2-1, randf()*2-1)
var controller:Node

func _process(delta):
	position += motion.normalized()*delta*50
	if position.x<0: motion.x = abs(motion.x)
	if position.y<0: motion.y = abs(motion.y)
	if position.x>G.view_size.x: motion.x = -abs(motion.x)
	if position.y>G.view_size.y: motion.y = -abs(motion.y)
	
	for e in controller.electrons:
		if e!=self && position.distance_to(e.position) < ELECTRON_INFLUENCE_DISTANCE:
			var x_force:float = (position.x-e.position.x)/PROTON_INFLUENCE_DISTANCE
			var y_force:float = (position.y-e.position.y)/PROTON_INFLUENCE_DISTANCE
			x_force = (abs(x_force)-1)*sign(x_force)
			y_force = (abs(y_force)-1)*sign(y_force)
			
			var force:Vector2 = Vector2(x_force, y_force)
			motion -= force*.001
	
	for p in controller.protons:
		if p!=self && position.distance_to(p.position) < PROTON_INFLUENCE_DISTANCE:
			motion += (position-p.position)/PROTON_INFLUENCE_DISTANCE*delta
	
	if motion.length() > 1: motion = motion.normalized()
