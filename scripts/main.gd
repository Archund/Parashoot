extends Node2D

var SKY
var PLAYER
var ENEMY
var timeout = 0.1
var timer = 0

func _ready():
	SKY = get_node("Sky")
	print(SKY.global_position)
	print(self.global_position)


func _process(delta):
	
	if(SKY.global_position.y < self.global_position.y && timer >= timeout):
		timer = 0
		SKY.global_position.y = SKY.global_position.y + 1

	timer = timer + delta