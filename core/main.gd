extends Node2D

const O_ELECTRON = preload("res://objects/electron/electron.tscn")
const O_PROTON = preload("res://objects/proton/proton.tscn")

var electrons:Array[Node]
var protons:Array[Node]
var neutrons:Array[Node]
var unknowns:Array[Node]

func _ready():
	for i in 200:
		var e = O_ELECTRON.instantiate()
		e.position = Vector2(G.view_size.x*randf(), G.view_size.y*randf())
		e.controller = self
		electrons.append(e)
		add_child(e)
		
	for i in 20:
		var p = O_PROTON.instantiate()
		p.position = Vector2(G.view_size.x*randf(), G.view_size.y*randf())
		p.controller = self
		protons.append(p)
		add_child(p)
