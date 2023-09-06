extends Sprite2D


const FRICTION:float = .95

const ELECTRON_INFLUENCE_DISTANCE:float = 10
const PROTON_INFLUENCE_DISTANCE:float = 100

var motion:Vector2 = Vector2(randf()*2-1, randf()*2-1)
var controller:Node

func _process(delta):
	if position.x<0: motion.x = abs(motion.x)
	if position.y<0: motion.y = abs(motion.y)
	if position.x>G.view_size.x: motion.x = -abs(motion.x)
	if position.y>G.view_size.y: motion.y = -abs(motion.y)
	position += motion*delta*250
	
	for e in controller.electrons:
		if e!=self && position.distance_to(e.position) < ELECTRON_INFLUENCE_DISTANCE:
			var x_force:float = (position.x-e.position.x)/PROTON_INFLUENCE_DISTANCE
			var y_force:float = (position.y-e.position.y)/PROTON_INFLUENCE_DISTANCE
			x_force = (abs(x_force)-1)*sign(x_force)
			y_force = (abs(y_force)-1)*sign(y_force)
			
			x_force = x_force*x_force*sign(x_force)
			y_force = y_force*y_force*sign(y_force)
			x_force = x_force*x_force*sign(x_force)
			y_force = y_force*y_force*sign(y_force)
			x_force = x_force*x_force*sign(x_force)
			y_force = y_force*y_force*sign(y_force)
			
			var force:Vector2 = Vector2(x_force, y_force)
			motion -= force*.1
#			motion += (position-e.position)/ELECTRON_INFLUENCE_DISTANCE*delta
	
	for p in controller.protons:
		if p!=self && position.distance_to(p.position) < PROTON_INFLUENCE_DISTANCE:
			var x_force:float = (position.x-p.position.x)/PROTON_INFLUENCE_DISTANCE
			var y_force:float = (position.y-p.position.y)/PROTON_INFLUENCE_DISTANCE
			x_force = (abs(x_force)-1)*sign(x_force)
			y_force = (abs(y_force)-1)*sign(y_force)
			
			var force:Vector2 = Vector2(x_force*x_force*sign(x_force), y_force*y_force*sign(y_force))
#			force *= 2
#			force = force*force
			
			motion += force*.1
#			motion -= (position-p.position)/PROTON_INFLUENCE_DISTANCE*delta*100
	
	motion *= FRICTION
#	if motion.length() < .1: motion = motion.normalized()*.1
