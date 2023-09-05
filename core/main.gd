extends Node2D

const O_ELECTRON = preload("res://objects/electron/electron.tscn")

var electrons:Array[Node]
var protons:Array[Node]
var neutrons:Array[Node]
var unknowns:Array[Node]

func _ready():
	for i in 500:
		var e = O_ELECTRON.instantiate()
		e.position = Vector2(G.view_size.x*randf(), G.view_size.y*randf())
		e.controller = self
		electrons.append(e)
		add_child(e)
